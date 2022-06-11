void setup() {
    fullScreen();
    background(255);
    noLoop();
    noStroke();
    
    for (int i = 0; i < random(20); i++)
        randomLines();
    
    // Create an image to store the new wallpaper
    PImage img = createImage(width, height, ARGB);
    img.loadPixels();
    
    // Load pixels which make up the window
    loadPixels();
    
    // Convert the window to an image
    for (int i = 0; i < pixels.length; i++)
        img.pixels[i] = pixels[i];
    
    img.updatePixels();
    
    // Save the image to ".\wallpaper.bmp"
    img.save(".\\wallpaper.bmp");
    
    exit();
}

/**
 * Make a random line between each pair of edges and fill one side of that line with a random colour
 */
void randomLines() {
    // Left-top
    fill(random(255), random(255), random(255), random(255));
    triangle(0, 0, 0, random(height), random(width), 0);
    
    // Top-bottom
    fill(random(255), random(255), random(255), random(255));
    quad(0, 0, random(width), 0, random(width), height, 0, height);
    
    // Top-right
    fill(random(255), random(255), random(255), random(255));
    triangle(random(width), 0, width, 0, width, random(height));
    
    // Left-bottom
    fill(random(255), random(255), random(255), random(255));
    triangle(0, random(height), 0, height, random(width), height);
    
    // Left-right
    fill(random(255), random(255), random(255), random(255));
    quad(0, random(height), 0, height, width, height, width, random(height));
    
    // Bottom-right
    fill(random(255), random(255), random(255), random(255));
    triangle(width, random(height), width, height, random(width), height);
}
