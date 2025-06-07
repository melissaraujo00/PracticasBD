<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use MongoDB\Laravel\Eloquent\Model;

class Producto extends Model
{
    use HasFactory;

    protected $connection = 'mongodb';
    protected $collection = 'productos';

    protected $fillable = [
        'nombre',
        'descripcion',
        'precio',
        'stock',
        'categoria_id', // ← Agregamos esto
    ];

    public function categoria()
    {
        return $this->belongsTo(Categoria::class);
    }
}
