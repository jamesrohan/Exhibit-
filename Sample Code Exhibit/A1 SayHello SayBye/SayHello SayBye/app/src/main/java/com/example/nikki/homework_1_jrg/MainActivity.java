package com.example.nikki.homework_1_jrg;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }


    public void sayHello(View v){
        EditText inputName = (EditText) findViewById(R.id.Name);
        TextView outputTextView = (TextView) findViewById(R.id.DisplayText);

        outputTextView.setText("Hello " + inputName.getText() );
        outputTextView.setVisibility(View.VISIBLE);
        inputName.setText("Name");
    }


    public void sayGoodBye(View v){
        EditText inputName = (EditText) findViewById(R.id.Name);
        TextView outputTextView = (TextView) findViewById(R.id.DisplayText);


        outputTextView.setText("Good Bye " + inputName.getText() );
        outputTextView.setVisibility(View.VISIBLE);
        inputName.setText("Name");
    }


}
