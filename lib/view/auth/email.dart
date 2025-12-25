import 'package:flutter/material.dart';

// Kept your GlobalKey as requested
var VerificationKey = GlobalKey<FormState>();



class SignInWithEmail extends StatefulWidget {
  // Kept your Route Name exactly as is
  static const String routename = "/auth/emailver";
  const SignInWithEmail({super.key});

  @override
  State<SignInWithEmail> createState() => _SignInWithEmailState();
}

enum AuthProcess { signin, createAccount }

class _SignInWithEmailState extends State<SignInWithEmail> {
  // Individual Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  AuthProcess process = AuthProcess.signin;

  // Simple Validation Logic
  void submit() {
    if (VerificationKey.currentState!.validate()) {
      VerificationKey.currentState!.save();
      print("Form is valid! Email: ${emailController.text}");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE23744),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Icon(Icons.restaurant_menu, size: 80, color: Colors.white),
              const Text("Zomato",
                  style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                    key: VerificationKey, // LINKED KEY HERE
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            _buildTab("Log In", process == AuthProcess.signin),
                            _buildTab("Create Account", process == AuthProcess.createAccount),
                          ],
                        ),
                        const SizedBox(height: 30),

                        // START OF INDIVIDUAL FIELDS
                        if (process == AuthProcess.createAccount) ...[
                          _buildTextField(
                            controller: nameController,
                            hint: "Full Name",
                            icon: Icons.person_outline,
                            validator: (val) => val!.isEmpty ? "Enter your name" : null,
                          ),
                          const SizedBox(height: 15),
                          _buildTextField(
                            controller: phoneController,
                            hint: "Phone No",
                            icon: Icons.phone_android,
                            validator: (val) => val!.length < 10 ? "Enter valid phone" : null,
                          ),
                          const SizedBox(height: 15),
                        ],

                        _buildTextField(
                          controller: emailController,
                          hint: "Email",
                          icon: Icons.email_outlined,
                          validator: (val) => !val!.contains("@") ? "Invalid Email" : null,
                        ),
                        const SizedBox(height: 15),

                        _buildTextField(
                          controller: passwordController,
                          hint: "Password (6+ Characters)",
                          icon: Icons.lock_outline,
                          isPassword: true,
                          validator: (val) => val!.length < 6 ? "Too short" : null,
                        ),

                        const SizedBox(height: 25),

                        // Main Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE23744),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text(
                              process == AuthProcess.signin ? "Sign In" : "Create Account",
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),
                        const Text("OR", style: TextStyle(color: Colors.grey, fontSize: 12)),
                        const SizedBox(height: 15),

                        // Facebook Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.facebook, color: Colors.white),
                            label: const Text("Continue with Facebook"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3B5998),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Simplified Individual Field Widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey, size: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE23744)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  Widget _buildTab(String label, bool isActive) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            process = (label == "Log In") ? AuthProcess.signin : AuthProcess.createAccount;
          });
        },
        child: Column(
          children: [
            Text(label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isActive ? const Color(0xFFE23744) : Colors.grey.shade400,
                )),
            const SizedBox(height: 5),
            Container(height: 3, width: 60, color: isActive ? const Color(0xFFE23744) : Colors.transparent),
          ],
        ),
      ),
    );
  }
}