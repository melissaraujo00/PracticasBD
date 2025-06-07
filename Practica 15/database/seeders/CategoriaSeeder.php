<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Categoria;

class CategoriaSeeder extends Seeder
{
    public function run(): void
    {
        $categorias = [
            ['nombre' => 'Tecnología', 'descripcion' => 'Productos electrónicos y digitales'],
            ['nombre' => 'Hogar', 'descripcion' => 'Artículos para el hogar'],
            ['nombre' => 'Ropa', 'descripcion' => 'Prendas de vestir'],
            ['nombre' => 'Deportes', 'descripcion' => 'Equipos y accesorios deportivos'],
        ];

        foreach ($categorias as $cat) {
            Categoria::create($cat);
        }
    }
}
