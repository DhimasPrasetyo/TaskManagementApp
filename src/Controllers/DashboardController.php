<?php

namespace App\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;
use Medoo\Medoo;

class DashboardController
{
    protected $view;
    protected $db;

    public function __construct(Twig $view, Medoo $db)
    {
        $this->view = $view;
        $this->db = $db;
    }

    // Halaman utama dashboard
    public function index(Request $request, Response $response): Response
    {
        $user = $_SESSION['user'] ?? null;
        if (!$user) {
            return $response->withHeader('Location', '/login')->withStatus(302);
        }

        // Ambil semua task dan kelompokkan berdasarkan status
        $tasks = $this->db->select("tbl_kanbans", "*");

        $grouped = [];
        foreach ($tasks as $task) {
            $grouped[$task['status']][] = $task;
        }

        return $this->view->render($response, 'dashboard.twig', [
            'user' => $user,
            'grouped_tasks' => $grouped
        ]);
    }

    // Tambah like (AJAX)
    public function like(Request $request, Response $response, array $args): Response
    {
        $id = $args['id'];

        // Tambah 1 like
        $this->db->update("tbl_kanbans", [
            "likes[+]" => 1
        ], ["id" => $id]);

        // Ambil jumlah terbaru
        $likes = $this->db->get("tbl_kanbans", "likes", ["id" => $id]);

        // Kembalikan sebagai JSON
        $response->getBody()->write(json_encode([
            'success' => true,
            'likes' => $likes
        ]));

        return $response->withHeader('Content-Type', 'application/json');
    }

    // Tambah komentar (AJAX)
    public function comment(Request $request, Response $response, array $args): Response
    {
        $id = $args['id'];

        $body = $request->getBody()->getContents();
        $data = json_decode($body, true);
        $commentText = $data['comment'] ?? null;

        // Validasi jika komentar kosong
        if (!$commentText) {
            $response->getBody()->write(json_encode(['success' => false, 'message' => 'Komentar kosong']));
            return $response->withHeader('Content-Type', 'application/json')->withStatus(400);
        }

        // Simpan jumlah komentar (+1)
        $this->db->update("tbl_kanbans", [
            "comments[+]" => 1
        ], ["id" => $id]);

        // (Opsional) Simpan isi komentar ke tabel `tbl_komentar` jika kamu buat
        /*
        $this->db->insert("tbl_komentar", [
            "task_id" => $id,
            "comment" => $commentText,
            "created_at" => date('Y-m-d H:i:s')
        ]);
        */

        $comments = $this->db->get("tbl_kanbans", "comments", ["id" => $id]);

        $response->getBody()->write(json_encode([
            'success' => true,
            'comments' => $comments
        ]));

        return $response->withHeader('Content-Type', 'application/json');
    }
}
