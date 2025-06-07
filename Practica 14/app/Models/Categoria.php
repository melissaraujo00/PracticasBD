<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use MongoDB\Laravel\Eloquent\Model;

class Categoria extends Model
{
    use HasFactory;

    protected $connection = 'mongodb';
    protected $collection = 'categorias';

    protected $fillable = [
        'nombre',
        'descripcion'
    ];

    public function productos()
    {
        return $this->hasMany(Producto::class);
    }
}
