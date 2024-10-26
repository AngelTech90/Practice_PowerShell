# Define the project name
$projectName = "LandingPage"

# Create the project directory
New-Item -ItemType Directory -Path $projectName

# Create subdirectories for HTML, CSS, JS, and Node.js
New-Item -ItemType Directory -Path "$projectName\css"
New-Item -ItemType Directory -Path "$projectName\js"
New-Item -ItemType Directory -Path "$projectName\node"

# Create the HTML file
$htmlContent = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing Page</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <header>
        <h1>Welcome to Our Landing Page</h1>
        <p>Your success starts here!</p>
    </header>
    <main>
        <section id="features">
            <h2>Features</h2>
            <p>Discover our amazing features.</p>
        </section>
        <section id="contact">
            <h2>Contact Us</h2>
            <p>Get in touch for more information.</p>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Landing Page. All rights reserved.</p>
    </footer>
    <script src="js/scripts.js"></script>
</body>
</html>
"@

Set-Content -Path "$projectName\index.html" -Value $htmlContent

# Create the CSS file
$cssContent = @"
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

header {
    background: #35424a;
    color: #ffffff;
    padding: 20px 0;
    text-align: center;
}

main {
    padding: 20px;
}

footer {
    text-align: center;
    padding: 10px 0;
    background: #35424a;
    color: #ffffff;
}
"@

Set-Content -Path "$projectName\css\styles.css" -Value $cssContent

# Create the JavaScript file
$jsContent = @"
document.addEventListener('DOMContentLoaded', function() {
    console.log('Landing page loaded!');
});
"@

Set-Content -Path "$projectName\js\scripts.js" -Value $jsContent

# Create a basic Node.js server file
$nodeContent = @"
const http = require('http');
const fs = require('fs');
const path = require('path');

const server = http.createServer((req, res) => {
    let filePath = path.join(__dirname, 'index.html');
    fs.readFile(filePath, (err, data) => {
        if (err) {
            res.writeHead(500);
            return res.end('Error loading index.html');
        }
        res.writeHead(200, { 'Content-Type': 'text/html' });
        res.end(data);
    });
});

const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
    console.log(\`Server running on http://localhost:\${PORT}\`);
});
"@

Set-Content -Path "$projectName\node\server.js" -Value $nodeContent

# Output completion message
Write-Host "Landing page structure created in '$projectName' directory."