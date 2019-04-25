import java.util.*;
import java.lang.*;
import java.util.Random;

// --------------------- Sketch-wide variables ----------------------
Table table;
String[] allSpeciesName = new String[15];
int speciesNum;
ArrayList<Species> allSpecies = new ArrayList<Species>();
//float bigCircleDia = 600;
//float interval;

float rt = 0;

Boolean level_two_exists,level_three_exists,level_four_exists,level_five_exists = false;
String curr_start,random_level_two_value,random_level_three_value,random_level_four_value,random_level_five_value;
ArrayList<String> level_two_list,level_three_list,level_four_list,level_five_list;
PImage tmpImg;
String[] tmpInfo;


// ------------------------ Initialisation --------------------------

// Initialises the data and bar chart.

// ------------------------ Initialisation --------------------------

// Initialises the data and bar chart.


void setup(){
  size(1650, 900, P3D);
  smooth(); 
  // ELLIPSE x, y, width, height
  //bigCircle = createShape(ELLIPSE,725,475,bigCircleDia,bigCircleDia);  
  // Load the data table.
  table = loadTable("Bell.csv");
  // The first row of the table saves all the name of species in the food web.
  // Extract them all and save them in a String array.
  TableRow row0 = table.getRow(0);
  for (int i = 1;i < row0.getColumnCount();i++){
    allSpeciesName[i-1] = row0.getString(i);
    println(allSpeciesName[i-1]);
  }
  // The first two columns are not species name
  // Initialize save all species information into an arraylist
  
  //require clean allSpecies since for repeating
  allSpecies.clear();
  
  for (int i = 3; i < table.getRowCount(); i++){
    allSpecies.add(new Species(table.getRow(i)));
    } 
  speciesNum = allSpecies.size();
  //My code start here
  //reset thr time value rt to 0
  println("\nThe next round start here!");
  rt = 0;
  //reset boolean value to check if each level exists
  level_two_exists = false;
  level_three_exists = false;
  level_four_exists = false;
  level_five_exists = false;
  
  ArrayList<String> random_start_list = new ArrayList<String>();
  random_start_list.add("Pine");
  random_start_list.add("Aspen");
  random_start_list.add("Spruce");
  random_start_list.add("Juneberry");
  
  Random r = new Random();
  int random_start_index = r.nextInt(4);
  curr_start = random_start_list.get(random_start_index);
  println(curr_start);
  
  rt = 0;
  //println("Name1:");
  //println(allSpecies.get(0).getName());
  //println("Name2:");
  //println(allSpecies.get(4).getName());
  //println("Their relation:");
  //println(allSpecies.get(0).getRelations().get(4));
  
  level_two_list = new ArrayList<String>();
  for(int i = 0; i < speciesNum; i++){  
    if(allSpecies.get(i).getName().equals(curr_start)){
      for(int j = 0; j < speciesNum; j++){
       float ijRelation = allSpecies.get(i).getRelations().get(j);
       if(ijRelation==4.0){
         level_two_list.add(allSpecies.get(j).getName());
       }
      }
    }
  }
  
  println(level_two_list);
  
  if (!level_two_list.isEmpty()){
    level_two_exists = true;
  }
  
  if (level_two_exists){
  int level_two_size = level_two_list.size();
  int random_level_two_index = r.nextInt(level_two_size);
  random_level_two_value = level_two_list.get(random_level_two_index);
  println(random_level_two_value);
    level_three_list = new ArrayList<String>();
    for(int i = 0; i < speciesNum; i++){  
      if(allSpecies.get(i).getName() == random_level_two_value){
        for(int j = 0; j < speciesNum; j++){
         float ijRelation = allSpecies.get(i).getRelations().get(j);
         if(ijRelation==4){
           level_three_list.add(allSpecies.get(j).getName());
         }
        }
      }
    }
    println(level_three_list);
    if (!level_three_list.isEmpty()){
      level_three_exists = true;
    }
  }
  
  if (level_three_exists){
    int level_three_size = level_three_list.size();
    int random_level_three_index = r.nextInt(level_three_size);
    random_level_three_value = level_three_list.get(random_level_three_index);
    println(random_level_three_value);
    level_four_list = new ArrayList<String>();
    for(int i = 0; i < speciesNum; i++){  
      if(allSpecies.get(i).getName() == random_level_three_value){
        for(int j = 0; j < speciesNum; j++){
         float ijRelation = allSpecies.get(i).getRelations().get(j);
         if(ijRelation==4){
           level_four_list.add(allSpecies.get(j).getName());
         }
        }
      }
    }
    println(level_four_list);
    if (!level_four_list.isEmpty()){
      level_four_exists = true;
    }
  }
  
  if (level_four_exists){
    int level_four_size = level_four_list.size();
    int random_level_four_index = r.nextInt(level_four_size);
    random_level_four_value = level_four_list.get(random_level_four_index);
    println(random_level_four_value);
    level_five_list = new ArrayList<String>();
    for(int i = 0; i < speciesNum; i++){  
      if(allSpecies.get(i).getName() == random_level_four_value){
        for(int j = 0; j < speciesNum; j++){
         float ijRelation = allSpecies.get(i).getRelations().get(j);
         if(ijRelation==4){
           level_five_list.add(allSpecies.get(j).getName());
         }
        }
      }
    }
    println(level_five_list);
    if (!level_five_list.isEmpty()){
      level_five_exists = true;
    }
  }
  
  if (level_five_exists){
    int level_five_size = level_five_list.size();
    int random_level_five_index = r.nextInt(level_five_size);
    random_level_five_value = level_five_list.get(random_level_five_index);
    println(random_level_five_value);
  }
  
}


void draw(){
  rt += 1;
  background(255); 
  stroke(255);
  fill(0);
  strokeWeight(5);
  if (rt  > 20){
  for(int i = 0; i < speciesNum; i++){  
      if(allSpecies.get(i).getName().equals(curr_start)){
        tmpImg = allSpecies.get(i).getImg();
        tmpInfo = allSpecies.get(i).getInfo();
        break;
      }
  }
  image(tmpImg,100,100,200,200);
  textSize(20);
  fill(252,146,114);
  text(curr_start, 100+50, 100+200+30); 
  fill(0);
  textSize(15);
  text(tmpInfo[0], 100-20, 100+200+80, 240, 500); 
  }
  if (rt >200 && level_two_exists){
  stroke(252,146,114);
  line(300,200,400-25,200);
  fill(252,146,114);
  triangle(400-25,200-10,400-25,200+10,400,200);
  fill(0);
  stroke(255);
  }else{
    if (rt  == 400){
    setup();
    }
  }
  if (rt>220 && level_two_exists){
  for(int i = 0; i < speciesNum; i++){  
      if(allSpecies.get(i).getName() == random_level_two_value){
        tmpImg = allSpecies.get(i).getImg();
        tmpInfo = allSpecies.get(i).getInfo();
        break;
      }
  }
  image(tmpImg,400,100,200,200);
  fill(251,106,74);
  textSize(20);
  text(random_level_two_value, 400+50, 100+200+30); 
  fill(0);
  textSize(15);
  text(tmpInfo[0], 400-20, 100+200+80, 240, 500); 
  }
  if (rt>400 && level_three_exists){
  stroke(251,106,74);
  line(600,200,700-25,200);
  fill(251,106,74);
  triangle(700-25,200-10,700-25,200+10,700,200);
  fill(0);
  stroke(255);
  }else{
    if (rt  == 600){
    setup();
    }
  }
  if (rt>420 && level_three_exists){
  for(int i = 0; i < speciesNum; i++){  
      if(allSpecies.get(i).getName() == random_level_three_value){
        tmpImg = allSpecies.get(i).getImg();
        tmpInfo = allSpecies.get(i).getInfo();
        break;
      }
  }
  image(tmpImg,700,100,200,200);
  fill(239,59,44);
  textSize(20);
  text(random_level_three_value, 700+50, 100+200+30); 
  fill(0);
  textSize(15);
  text(tmpInfo[0], 700-20, 100+200+80, 240, 500); 
  }
  if (rt>600 && level_four_exists){
  stroke(239,59,44);
  line(900,200,1000-25,200);
  fill(239,59,44);
  triangle(1000-25,200-10,1000-25,200+10,1000,200);
  fill(0);
  stroke(255);
  }else{
    if (rt  == 800){
    setup();
    }
  }
  if (rt>620 && level_four_exists){
  for(int i = 0; i < speciesNum; i++){  
      if(allSpecies.get(i).getName() == random_level_four_value){
        tmpImg = allSpecies.get(i).getImg();
        tmpInfo = allSpecies.get(i).getInfo();
        break;
      }
  }
  image(tmpImg,1000,100,200,200);
  fill(203,24,29);
  textSize(20);
  text(random_level_four_value, 1000+50, 100+200+30); 
  fill(0);
  textSize(15);
  text(tmpInfo[0], 1000-20, 100+200+80, 240, 500); 
  }
  if (rt>800 && level_five_exists){
  stroke(203,24,29);
  line(1200,200,1300-25,200);
  fill(203,24,29);
  triangle(1300-25,200-10,1300-25,200+10,1300,200);
  fill(0);
  stroke(255);
  }else{
    if (rt  == 1000){
    setup();
    }
  }
  if (rt>820 && level_five_exists){
  for(int i = 0; i < speciesNum; i++){  
      if(allSpecies.get(i).getName() == random_level_five_value){
        tmpImg = allSpecies.get(i).getImg();
        tmpInfo = allSpecies.get(i).getInfo();
        break;
      }
  }
  image(tmpImg,1300,100,200,200);
  fill(165,15,21);
  textSize(20);
  text(random_level_five_value, 1300+50, 100+200+30); 
  fill(0);
  textSize(15);
  text(tmpInfo[0], 1300-20, 100+200+80, 240, 500); 
  }
  if (rt  == 1200){
    setup();
  }
}
