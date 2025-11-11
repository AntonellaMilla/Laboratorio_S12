import 'package:flutter/cupertino.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Registro de Productos',
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
        scaffoldBackgroundColor: CupertinoColors.systemBackground,
        brightness: Brightness.light,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/menu': (context) => const MenuScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/register': (context) => const RegisterProductScreen(),
        '/products': (context) => const ProductsScreen(),
        '/logout': (context) => const LogoutScreen(),
      },
    );
  }
}

// **Pantalla Splash Screen con Gradiente**
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF007AFF), // iOS Blue
              Color(0xFF5856D6), // iOS Purple
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Contenedor con efecto glassmorphism
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: CupertinoColors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: CupertinoColors.white.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  CupertinoIcons.cube_box_fill,
                  size: 80,
                  color: CupertinoColors.white,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Registro de Productos',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Gestiona tus productos con estilo iOS',
                style: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: CupertinoButton.filled(
                  borderRadius: BorderRadius.circular(12),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text(
                    'Comenzar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// **Pantalla de Login con Diseño Mejorado**
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF007AFF),
              Color(0xFFE5E5EA),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Logo con fondo glassmorphism
                    Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: CupertinoColors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        CupertinoIcons.cube_box_fill,
                        size: 70,
                        color: Color(0xFF007AFF),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Bienvenido',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Inicia sesión para continuar',
                      style: TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.white,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Campos con fondo blanco y sombra
                    Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.black.withOpacity(0.1),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: CupertinoTextField(
                        controller: _emailController,
                        placeholder: 'Correo electrónico',
                        padding: const EdgeInsets.all(18),
                        prefix: const Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Icon(
                            CupertinoIcons.mail_solid,
                            color: Color(0xFF007AFF),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const BoxDecoration(
                          border: Border(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.black.withOpacity(0.1),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: CupertinoTextField(
                        controller: _passwordController,
                        placeholder: 'Contraseña',
                        padding: const EdgeInsets.all(18),
                        prefix: const Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Icon(
                            CupertinoIcons.lock_fill,
                            color: Color(0xFF007AFF),
                          ),
                        ),
                        suffix: CupertinoButton(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            _obscurePassword
                                ? CupertinoIcons.eye_slash_fill
                                : CupertinoIcons.eye_fill,
                            color: CupertinoColors.systemGrey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        obscureText: _obscurePassword,
                        decoration: const BoxDecoration(
                          border: Border(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF007AFF).withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: CupertinoButton.filled(
                        borderRadius: BorderRadius.circular(12),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/menu');
                        },
                        child: const Text(
                          'Iniciar Sesión',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// **Pantalla de Menú con Cards Coloridas**
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Menú'),
        backgroundColor: const Color(0xFF007AFF),
        border: null,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            const SizedBox(height: 10),
            const Text(
              'Panel Principal',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.black,
              ),
            ),
            const SizedBox(height: 20),
            _buildMenuItem(
              context,
              icon: CupertinoIcons.house_fill,
              title: 'Home',
              subtitle: 'Página principal',
              color: const Color(0xFF007AFF),
              onTap: () => Navigator.pushNamed(context, '/home'),
            ),
            _buildMenuItem(
              context,
              icon: CupertinoIcons.person_fill,
              title: 'Profile',
              subtitle: 'Tu perfil personal',
              color: const Color(0xFF5856D6),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            _buildMenuItem(
              context,
              icon: CupertinoIcons.settings_solid,
              title: 'Settings',
              subtitle: 'Configuración',
              color: const Color(0xFF8E8E93),
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
            _buildMenuItem(
              context,
              icon: CupertinoIcons.add_circled_solid,
              title: 'Registro de Productos',
              subtitle: 'Añade nuevos productos',
              color: const Color(0xFF34C759),
              onTap: () => Navigator.pushNamed(context, '/register'),
            ),
            _buildMenuItem(
              context,
              icon: CupertinoIcons.cube_box_fill,
              title: 'Productos',
              subtitle: 'Ver todos los productos',
              color: const Color(0xFFFF9500),
              onTap: () => Navigator.pushNamed(context, '/products'),
            ),
            _buildMenuItem(
              context,
              icon: CupertinoIcons.arrow_right_square_fill,
              title: 'Logout',
              subtitle: 'Cerrar sesión',
              color: const Color(0xFFFF3B30),
              onTap: () => Navigator.pushNamed(context, '/logout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: CupertinoListTile(
        padding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: CupertinoColors.systemGrey, fontSize: 14),
        ),
        trailing: Icon(
          CupertinoIcons.chevron_right,
          size: 20,
          color: color,
        ),
        onTap: onTap,
      ),
    );
  }
}

// **Pantalla de Home con Estadísticas**
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Home'),
        backgroundColor: const Color(0xFF007AFF),
        border: null,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SizedBox(height: 10),
            const Text(
              '¡Bienvenido!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Antonella Milla',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF007AFF),
              ),
            ),
            const SizedBox(height: 30),
            // Estadísticas en cards con gradiente
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    '5',
                    'Productos',
                    CupertinoIcons.cube_box_fill,
                    const Color(0xFF007AFF),
                    const Color(0xFF5856D6),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    '\$95',
                    'Total',
                    CupertinoIcons.money_dollar_circle_fill,
                    const Color(0xFF34C759),
                    const Color(0xFF30D158),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Productos Destacados',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            _buildProductCard('Producto A', '\$15.00', const Color(0xFFFF9500)),
            _buildProductCard('Producto B', '\$25.00', const Color(0xFF5856D6)),
            _buildProductCard('Producto C', '\$35.00', const Color(0xFFFF2D55)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon, Color color1, Color color2) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color1.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: CupertinoColors.white, size: 30),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.white,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: CupertinoColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String name, String price, Color accentColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CupertinoListTile(
        padding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            CupertinoIcons.bag_fill,
            color: accentColor,
            size: 24,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          price,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: accentColor,
            fontSize: 16,
          ),
        ),
        trailing: Icon(
          CupertinoIcons.chevron_right,
          size: 20,
          color: accentColor,
        ),
      ),
    );
  }
}

// **Pantalla de Profile**
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Profile'),
        backgroundColor: const Color(0xFF007AFF),
        border: null,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF007AFF), Color(0xFF5856D6)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF007AFF).withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(65),
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    color: CupertinoColors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(62),
                      child: Image.network(
                        'https://placekitten.com/200/200',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Antonella Milla',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Antonella.milla@example.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: CupertinoColors.systemGrey,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Text(
                'Soy una desarrolladora apasionada por las tecnologías móviles y el diseño iOS.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF34C759), Color(0xFF30D158)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      children: [
                        Icon(CupertinoIcons.cube_box_fill, color: CupertinoColors.white, size: 30),
                        SizedBox(height: 10),
                        Text(
                          '5',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.white,
                          ),
                        ),
                        Text(
                          'Productos',
                          style: TextStyle(color: CupertinoColors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF5856D6), Color(0xFFAF52DE)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      children: [
                        Icon(CupertinoIcons.clock_fill, color: CupertinoColors.white, size: 30),
                        SizedBox(height: 10),
                        Text(
                          '2h',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.white,
                          ),
                        ),
                        Text(
                          'Última vez',
                          style: TextStyle(color: CupertinoColors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// **Pantalla de Settings**
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Settings'),
        backgroundColor: const Color(0xFF007AFF),
        border: null,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            const SizedBox(height: 10),
            const Text(
              'Configuración',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildSettingItem(
              CupertinoIcons.person_crop_circle_fill,
              'Cambiar Usuario',
              const Color(0xFF007AFF),
              () {},
            ),
            _buildSettingItem(
              CupertinoIcons.paintbrush_fill,
              'Cambiar Tema',
              const Color(0xFF5856D6),
              () {},
            ),
            _buildSettingItem(
              CupertinoIcons.globe,
              'Idioma',
              const Color(0xFF34C759),
              () {},
            ),
            _buildSettingItem(
              CupertinoIcons.clock_fill,
              'Hora y Fecha',
              const Color(0xFFFF9500),
              () {},
            ),
            _buildSettingItem(
              CupertinoIcons.photo_fill,
              'Wallpaper',
              const Color(0xFFFF2D55),
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, Color color, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CupertinoListTile(
        padding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: Icon(
          CupertinoIcons.chevron_right,
          size: 20,
          color: color,
        ),
        onTap: onTap,
      ),
    );
  }
}

// **Pantalla de Registro de Producto**
class RegisterProductScreen extends StatelessWidget {
  const RegisterProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _productNameController = TextEditingController();
    final TextEditingController _productPriceController = TextEditingController();
    final TextEditingController _productDescriptionController = TextEditingController();

    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Registro de Producto'),
        backgroundColor: const Color(0xFF34C759),
        border: null,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Nuevo Producto',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: CupertinoTextField(
                  controller: _productNameController,
                  placeholder: 'Nombre del Producto',
                  padding: const EdgeInsets.all(18),
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Icon(
                      CupertinoIcons.bag_fill,
                      color: Color(0xFF34C759),
                    ),
                  ),
                  decoration: const BoxDecoration(),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: CupertinoTextField(
                  controller: _productPriceController,
                  placeholder: 'Precio del Producto',
                  padding: const EdgeInsets.all(18),
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Icon(
                      CupertinoIcons.money_dollar_circle_fill,
                      color: Color(0xFF34C759),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  decoration: const BoxDecoration(),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: CupertinoTextField(
                  controller: _productDescriptionController,
                  placeholder: 'Descripción',
                  padding: const EdgeInsets.all(18),
                  maxLines: 3,
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Icon(
                      CupertinoIcons.text_justify,
                      color: Color(0xFF34C759),
                    ),
                  ),
                  decoration: const BoxDecoration(),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF34C759).withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: CupertinoButton.filled(
                  borderRadius: BorderRadius.circular(12),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  onPressed: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: const Text('Producto Registrado'),
                          content: Text(
                              'El producto "${_productNameController.text}" se ha agregado correctamente.'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, '/products');
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Registrar Producto',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// **Pantalla de Productos**
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {'name': 'Producto A', 'price': '\$15.00', 'color': const Color(0xFF007AFF)},
      {'name': 'Producto B', 'price': '\$25.00', 'color': const Color(0xFFFF9500)},
      {'name': 'Producto C', 'price': '\$35.00', 'color': const Color(0xFF34C759)},
      {'name': 'Producto D', 'price': '\$45.00', 'color': const Color(0xFFFF2D55)},
    ];

    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Productos'),
        backgroundColor: const Color(0xFF5856D6),
        border: null,
      ),
      child: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: product['color'].withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: CupertinoListTile(
                padding: const EdgeInsets.all(16),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: product['color'].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    CupertinoIcons.cube_box_fill,
                    color: product['color'],
                    size: 24,
                  ),
                ),
                title: Text(
                  product['name'],
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  product['price'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: product['color'],
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(
                  CupertinoIcons.chevron_right,
                  size: 20,
                  color: product['color'],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// **Pantalla de Logout**
class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Cerrar Sesión'),
        backgroundColor: const Color(0xFFFF3B30),
        border: null,
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.power,
                color: Color(0xFFFF3B30),
                size: 80,
              ),
              const SizedBox(height: 20),
              const Text(
                '¿Deseas cerrar sesión?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    color: const Color(0xFFFF3B30),
                    borderRadius: BorderRadius.circular(12),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                    },
                    child: const Text(
                      'Cerrar Sesión',
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  CupertinoButton(
                    color: CupertinoColors.systemGrey2,
                    borderRadius: BorderRadius.circular(12),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
