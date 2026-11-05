import 'package:flutter/material.dart';

import 'package:tlapaleria_app/core/theme/app_theme.dart';
import 'package:tlapaleria_app/core/widgets/empty_state.dart';
import 'package:tlapaleria_app/core/widgets/product_card.dart';
import 'package:tlapaleria_app/data/repositories/product_repository.dart';
import 'package:tlapaleria_app/features/cart/cart_action.dart';
import 'package:tlapaleria_app/features/product_detail/product_detail_screen.dart';
import 'package:tlapaleria_app/models/product.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final ProductRepository _repository = ProductRepository();
  String categoriaSeleccionada = 'Todas';
  String textoBusqueda = '';

  // Categorías disponibles, tomadas de los productos del repositorio.
  List<String> get categorias {
    final nombres =
        _repository.obtenerProductos().map((p) => p.categoria).toSet().toList();
    return ['Todas', ...nombres];
  }

  // Lista filtrada por categoría y por texto de búsqueda.
  List<Product> get productosFiltrados {
    final busqueda = textoBusqueda.trim().toLowerCase();
    return _repository.obtenerProductos().where((producto) {
      final coincideCategoria = categoriaSeleccionada == 'Todas' ||
          producto.categoria == categoriaSeleccionada;
      final coincideBusqueda = producto.nombre.toLowerCase().contains(busqueda);
      return coincideCategoria && coincideBusqueda;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final lista = productosFiltrados;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
        actions: const [CartAction()],
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.sm,
            ),
            child: TextField(
              onChanged: (texto) {
                setState(() {
                  textoBusqueda = texto;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar producto...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.blanco,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // Chips de categoría (con scroll horizontal por si son muchas)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Row(
              children: categorias.map(_chipFiltro).toList(),
            ),
          ),

          // Resultados
          Expanded(
            child: lista.isEmpty
                ? const EmptyState(
                    icono: Icons.search_off,
                    mensaje: 'No se encontraron productos',
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.66,
                    ),
                    itemCount: lista.length,
                    itemBuilder: (context, index) {
                      final producto = lista[index];

                      return ProductCard(
                        producto: producto,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(producto: producto),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _chipFiltro(String nombre) {
    final seleccionado = categoriaSeleccionada == nombre;

    return Padding(
      padding: const EdgeInsets.only(right: AppSpacing.sm),
      child: ChoiceChip(
        label: Text(nombre),
        selected: seleccionado,
        labelStyle: TextStyle(
          color: seleccionado ? Colors.white : AppColors.textoPrincipal,
        ),
        onSelected: (_) {
          setState(() {
            categoriaSeleccionada = nombre;
          });
        },
      ),
    );
  }
}