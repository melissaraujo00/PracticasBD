<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('facultad', function (Blueprint $table) {
            $table->unsignedBigInteger('id_facultad', true);
            $table->string('nombre', 100);
            $table->string('decano', 100);
            $table->timestamps();
        });
    }

    public function down(){
        schema::dropIdExits('facultad')
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('facultad_migration');
    }
};
