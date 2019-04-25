import java.util.*;
import java.io.*;

public class Species {
  private String name;
  private ArrayList<Float> relations = new ArrayList<Float>();
  private String[] info;
  private PImage img;
  public Species(TableRow speciesRow){
  //no = idx;
  for(int i = 0; i < speciesRow.getColumnCount(); i++){
      if(i==0) name = speciesRow.getString(i);
      else relations.add(speciesRow.getFloat(i));
    }
  if (!name.isEmpty()){
    img = loadImage("./pics/" + name + ".jpg");
    info = loadStrings("./intro/" + name + ".txt");
    }
  }
  
  public PImage getImg(){
    return img;
  }
  
  public String[] getInfo(){
    return info;
  }
  
  public String getName(){
    return name;
  }
  public ArrayList<Float> getRelations(){
    return relations;
  }
}
  
