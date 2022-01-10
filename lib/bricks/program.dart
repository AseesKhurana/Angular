import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

jackjohn(int n){
  bool turn= true;
  int comp= 0;
  int i=1;
  int j=0;
  int jackTurn=0;
  int johnTurn=0;

  while(comp<n){
    if(turn){
      if(comp+i<n){
        comp+=i;
      }
      else{
        i= n-comp;
        comp+= i;
      }
      turn= false;
      jackTurn+= 1;
    }
    else{
      j=i*2;
      if(comp+j<n){
        comp+= j;
      }
      else{
        j= n-comp;
        comp+= j;
      }
      turn=true;
      i=i+1;
      johnTurn+=1;
    }
  }

  List<Widget> placeOrder = [SizedBox(height: 5)];
  placeOrder.add(SizedBox(height: 10));
  placeOrder.add(ListTile(
    title: Text("Turns of Jack", style: TextStyle(fontSize: 20, color: Colors.blue),),
    subtitle: Text("$jackTurn"),
  )
  );
  placeOrder.add(ListTile(
    title: Text("Turns of John", style: TextStyle(fontSize: 20, color: Colors.blue),),
    subtitle: Text("$johnTurn"),
  )
  );
  if(turn){
    placeOrder.add(
        ListTile(
            title: (Text("John placed the last brick", style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.w700),))
        )
    );
    placeOrder.add(Divider());
    placeOrder.add(ListTile(
      title: Text("Number of bricks placed lastly = $j", style: TextStyle(fontSize: 20, color: Colors.blue)),
    )
    );
  }
  else{
    placeOrder.add(
        ListTile(
          title: Text("Jack placed the last brick", style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.w700),),
        )
    );
    placeOrder.add(Divider());
    placeOrder.add(ListTile(
      title: Text("Number of bricks placed lastly = $i", style: TextStyle(fontSize: 20, color: Colors.blue)),
    )
    ) ;
  }

  return ListView(
    padding: EdgeInsets.all(10),
    children: placeOrder,
  );
}