<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\JsonResponse;

class ProjectController extends Controller
{
    /**
     * Extrae los proyectos de la base de datos y los retorna en formato JSON.
     */
    public function index(): JsonResponse
    {
        // Utilizamos el Query Builder nativo de Laravel para mayor velocidad
        $projects = DB::table('projects')->get();

        return response()->json([
            'source' => 'Laravel 13 (MySQL)',
            'count' => $projects->count(),
            'data' => $projects
        ], 200);
    }
}
