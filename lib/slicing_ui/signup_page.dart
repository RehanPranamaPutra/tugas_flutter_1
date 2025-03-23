import 'package:flutter/material.dart';
import 'package:flutter_tugas1/slicing_ui/login_page.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const RegisterPage());
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  bool _isPasswordVisible = false;

  // Variabel untuk menampilkan hasil input setelah klik Sign Up
  String? _submittedName;
  String? _submittedEmail;
  String? _submittedMobile;
  String? _submittedDate;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dateController.text = DateFormat("dd-MM-yyyy").format(picked);
      });
    }
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _submittedName = fullNameController.text;
        _submittedEmail = emailController.text;
        _submittedMobile = mobileController.text;
        _submittedDate = dateController.text;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registrasi Berhasil!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // HEADER
              Container(
                height: 150,
                color: Colors.amber,
                child: Center(
                  child: Text(
                    'New Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // FORM INPUT
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Full Name
                    Text('Full Name'),
                    TextFormField(
                      controller: fullNameController,
                      decoration: _inputDecoration('Your Full Name'),
                      validator: (value) =>
                          value!.isEmpty ? "Full Name tidak boleh kosong" : null,
                    ),
                    SizedBox(height: 15),

                    // Password
                    Text('Password'),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: _inputDecoration('Enter Password').copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Password tidak boleh kosong" : null,
                    ),
                    SizedBox(height: 15),

                    // Email
                    Text('Email'),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: _inputDecoration('example@example.com'),
                      validator: (value) =>
                          value!.isEmpty ? "Email tidak boleh kosong" : null,
                    ),
                    SizedBox(height: 15),

                    // Mobile Number
                    Text('Mobile Number'),
                    TextFormField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      decoration: _inputDecoration('+123 456 789'),
                      validator: (value) =>
                          value!.isEmpty ? "Nomor HP tidak boleh kosong" : null,
                    ),
                    SizedBox(height: 15),

                    // Date of Birth
                    Text('Date of Birth'),
                    InkWell(
                      onTap: () => _selectDate(context),
                      child: IgnorePointer(
                        child: TextFormField(
                          controller: dateController,
                          decoration: _inputDecoration('DD / MM / YYYY'),
                          validator: (value) =>
                              value!.isEmpty ? "Tanggal lahir tidak boleh kosong" : null,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Terms and Conditions
                    Center(
                      child: Text(
                        'By continuing, you agree to Terms of Use and Privacy Policy.',
                        style: TextStyle(color: Colors.red, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10),

                    // Sign Up Button
                    Center(
                      child: ElevatedButton(
                        onPressed: _signUp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding:
                              EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Hasil Input yang Ditampilkan
                    if (_submittedName != null) ...[
                      Divider(color: Colors.grey),
                      Text(
                        "Data yang Dimasukkan:",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text("👤 Full Name: $_submittedName"),
                      Text("📧 Email: $_submittedEmail"),
                      Text("📞 Mobile: $_submittedMobile"),
                      Text("🎂 Date of Birth: $_submittedDate"),
                      SizedBox(height: 10),
                      Divider(color: Colors.grey),
                    ],

                    SizedBox(height: 10),

                    // Already have an account?
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Already have an account? Log in',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Dekorasi input field untuk konsistensi
  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.amber.shade100,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }
}
