<?php

declare(strict_types=1);

use DI\ContainerBuilder;
use Medoo\Medoo;
use Slim\Views\Twig;
use Psr\Container\ContainerInterface;
use App\Controllers\DashboardController;
use App\Controllers\AuthController;
use App\Controllers\ContactController;
use App\Controllers\KanbanController;
use App\Controllers\TaskController;
use App\Controllers\TeamController;
use App\Controllers\BoardController;

return function (ContainerBuilder $containerBuilder) {
    $containerBuilder->addDefinitions([

        // Twig View
        Twig::class => function () {
            if (session_status() === PHP_SESSION_NONE) {
                session_start();
            }

            $twig = Twig::create(__DIR__ . '/../templates', ['cache' => false]);
            $twig->getEnvironment()->addGlobal('session', $_SESSION);

            return $twig;
        },

        // Medoo Database
        'db' => function () {
            return new Medoo([
                'type' => 'mysql',
                'host' => 'localhost',
                'database' => 'taks_management_app',
                'username' => 'root',
                'password' => '',
                'charset' => 'utf8mb4',
            ]);
        },

        // Controllers
        AuthController::class => function (ContainerInterface $c) {
            return new AuthController($c->get(Twig::class), $c->get('db'));
        },

        DashboardController::class => function (ContainerInterface $c) {
            return new DashboardController($c->get(Twig::class));
        },

        ContactController::class => function (ContainerInterface $c) {
            return new ContactController($c);
        },

        KanbanController::class => function (ContainerInterface $c) {
            return new KanbanController($c->get(Twig::class), $c->get('db'));
        },

        TaskController::class => function (ContainerInterface $c) {
            return new TaskController($c->get(Twig::class), $c->get('db'));
        },

        TeamController::class => function (ContainerInterface $c) {
            return new TeamController($c->get(Twig::class), $c->get('db'));
        },

       BoardController::class => function (ContainerInterface $c) {
    return new BoardController(
        $c->get(Twig::class),
        $c->get('db')
    );
        },
    ]);
};
