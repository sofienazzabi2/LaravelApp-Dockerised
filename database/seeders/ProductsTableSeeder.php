<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Define products data
        $products = [
            ['name' => 'Product 1', 'price' => 10.99, 'description' => 'Description of Product 1'],
            ['name' => 'Product 2', 'price' => 20.99, 'description' => 'Description of Product 2'],
            ['name' => 'Product 3', 'price' => 30.99, 'description' => 'Description of Product 3'],
        ];

        // Insert products into the database
        DB::table('products')->insert($products);
    }
}
