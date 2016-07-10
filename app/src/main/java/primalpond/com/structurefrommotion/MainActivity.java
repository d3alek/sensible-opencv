package primalpond.com.structurefrommotion;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TextView textView = (TextView) findViewById(R.id.hello);
        textView.setText(hello());
    }

    static {
        System.loadLibrary("hello");
    }

    public native String hello();
}
