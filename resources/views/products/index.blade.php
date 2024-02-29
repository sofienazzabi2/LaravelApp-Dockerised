<h1>All Products</h1>

<ul>
    @foreach ($products as $product)
    <li>{{ $product->name }} - ${{ $product->price }}</li>
    @endforeach
</ul>