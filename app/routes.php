<?php

declare(strict_types=1);

use App\Controllers\HomeController;
use App\Controllers\AuthController;
use App\Controllers\DashboardController;
use App\Controllers\ContactController;
use App\Controllers\KanbanController;
use App\Controllers\TaskController;
use App\Controllers\TeamController;
use App\Controllers\BoardController;

use Slim\App;

return function (App $app) {
    session_start();

    // Halaman Home
    $app->get('/', [HomeController::class, 'index']);

    // Auth routes
    $app->get('/login', [AuthController::class, 'showLoginForm']);
    $app->post('/login', [AuthController::class, 'login']);

    $app->get('/register', [AuthController::class, 'showRegisterForm']);
    $app->post('/register', [AuthController::class, 'register']);

    $app->get('/logout', [AuthController::class, 'logout']);

    // Dashboard (gunakan KanbanController sebagai tampilan utama)
    $app->get('/dashboard', [KanbanController::class, 'index']);

    // Kontak
    $app->post('/contact/submit', [ContactController::class, 'submit']);

    // Kanban routes
    $app->get('/kanban/create', [KanbanController::class, 'showCreateForm']);
  
   $app->post('/kanban/store', [KanbanController::class, 'store']);

//task
    $app->get('/tasks', [TaskController::class, 'index']);              // Tampilkan semua task
    $app->get('/tasks/create', [TaskController::class, 'createForm']);  // Form tambah task
    $app->post('/tasks/create', [TaskController::class, 'store']);      // Simpan task
    $app->get('/tasks/edit/{id}', [TaskController::class, 'editForm']); // Form edit task
    $app->post('/tasks/edit/{id}', [TaskController::class, 'update']);  // Proses update
    $app->get('/tasks/delete/{id}', [TaskController::class, 'delete']); // Hapus task
    $app->get('/tasks/detail/{id}', [TaskController::class, 'detail']); // Detail task

// Teams
$app->get('/teams', [TeamController::class, 'index']);
$app->get('/teams/create', [TeamController::class, 'createForm']);
$app->post('/teams/create', [TeamController::class, 'store']);
$app->get('/teams/edit/{id}', [TeamController::class, 'editForm']);
$app->post('/teams/edit/{id}', [TeamController::class, 'update']);
$app->get('/teams/delete/{id}', [TeamController::class, 'delete']);

// Team Members
$app->get('/teams/{id}/members', [TeamController::class, 'members']);
$app->post('/teams/{id}/members/add', [TeamController::class, 'addMember']);
$app->get('/teams/{id}/members/delete/{member_id}', [TeamController::class, 'deleteMember']);

// board 
$app->get('/boards', [BoardController::class, 'index']);
$app->post('/boards/create', [BoardController::class, 'store']);
$app->get('/boards/delete/{id}', [BoardController::class, 'delete']);
$app->post('/kanban/like/{id}', \App\Controllers\DashboardController::class . ':like');
$app->post('/kanban/comment/{id}', \App\Controllers\DashboardController::class . ':comment');


};
