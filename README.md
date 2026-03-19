# 📸 CloudSnap - Your Personal Cloud Gallery
A modern, minimalist cloud gallery built with Flutter and Supabase that lets you capture, store, and share moments instantly.

✨ Features
📱 Clean Gallery View	All your images in one place, displayed beautifully
📸 Capture & Upload	Take photos directly or pick from gallery
☁️ Cloud Storage	Secure storage powered by Supabase
🔗 Instant Sharing	Share any image to social media platforms
🗑️ Easy Management	Delete images you no longer need
⏱️ Image Details	View upload timestamp and metadata
🔐 Single User Flow	Simple, personal gallery experience

#  🎯 How It Works
1. Upload
Open the app → tap the + button → choose camera or gallery → image uploads automatically to cloud

2. View
All uploaded images appear on the home screen in a clean grid layout

3. Interact
Tap any image → opens detail view with options:

📤 Share on social media (WhatsApp, Instagram, Twitter, etc.)

🗑️ Delete image

📅 View upload date & time

ℹ️ Image metadata

# 🛠️ Tech Stack
Frontend: Flutter (Dart)

Backend: Supabase (PostgreSQL, Storage, Authentication)

State Management:GetX

Image Picker: image_picker package

# 🚀 Getting Started
Prerequisites
Flutter SDK

Supabase account

Basic knowledge of Dart/Flutter

# Installation
bash
# Clone the repository
git clone https://github.com/yourusername/cloudsnap.git

# Navigate to project
cd cloudsnap

# Install dependencies
flutter pub get

# Run the app
flutter run
Supabase Setup
Create a new Supabase project

Set up a storage bucket named gallery-images

Create a table images with columns:

id (uuid, primary key)

image_url (text)

created_at (timestamp)

user_id (uuid, references auth.users)

Add your Supabase URL and anon key to .env file

# Home Gallery	Image Detail	Upload
🧰 Dependencies
yaml
dependencies:
  flutter:
    sdk: flutter
  supabase_flutter: ^latest
  image_picker: ^latest
  share_plus: ^latest
  intl: ^latest
  # add others as needed
  
# 🤝 Contributing
This was built as a learning project to explore Flutter + Supabase integration. Feel free to fork, experiment, and improve!

Fork the project

Create your feature branch (git checkout -b feature/AmazingFeature)

Commit your changes (git commit -m 'Add some AmazingFeature')

Push to the branch (git push origin feature/AmazingFeature)

Open a Pull Request

# 📄 License
Distributed under the MIT License. See LICENSE for more information.

# 📬 Connect
Faizan Sarfraz

GitHub: @chfaizan1537

LinkedIn: https://www.linkedin.com/in/faizan-sarfraz-3b150638b 

Built with ☕ and Flutter as a personal learning project to understand cloud integration with mobile apps.

⭐ If you found this useful, consider giving it a star on GitHub!
