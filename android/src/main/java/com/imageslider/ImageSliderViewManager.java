package com.imageslider;

import android.graphics.Color;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.LinearSnapHelper;
import androidx.recyclerview.widget.RecyclerView;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.facebook.react.common.MapBuilder;
import com.facebook.react.uimanager.events.RCTEventEmitter;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.WritableMap;
import com.imageslider.Slider.SliderAdapter;

import java.util.LinkedList;
import java.util.Map;

public class ImageSliderViewManager extends SimpleViewManager<RecyclerView> {
  public static final String REACT_CLASS = "ImageSliderView";
  private SliderAdapter adapter;
  private LinkedList<String> images = new LinkedList<>();
  private ThemedReactContext reactContext;
  @Override
  @NonNull
  public String getName() {
    return REACT_CLASS;
  }

  @Override
  @NonNull
  public RecyclerView createViewInstance(ThemedReactContext reactContext) {
    this.reactContext=reactContext;
    RecyclerView recyclerView = new RecyclerView(reactContext);
    images = new LinkedList<>();
    adapter = new SliderAdapter(reactContext, images);

    LinearLayoutManager manager = new LinearLayoutManager(reactContext, RecyclerView.HORIZONTAL, false);
    recyclerView.setLayoutManager(manager);
    LinearSnapHelper helper = new LinearSnapHelper();
    helper.attachToRecyclerView(recyclerView);
    recyclerView.setAdapter(adapter);

    recyclerView.setOnScrollListener(new RecyclerView.OnScrollListener() {
      @Override
      public void onScrolled(@NonNull RecyclerView recyclerView, int dx, int dy) {
        super.onScrolled(recyclerView, dx, dy);
        int position=manager.findFirstCompletelyVisibleItemPosition();
        if (position != -1){
          WritableMap event = Arguments.createMap();
          event.putInt("data", position);
          reactContext.getJSModule(RCTEventEmitter.class).receiveEvent(
            recyclerView.getId(),
            "topChange",
            event);
        }
      }
    });

    return recyclerView;
  }

  @ReactProp(name = "color")
  public void setColor(View view, String color) {
    view.setBackgroundColor(Color.parseColor(color));
  }

  @ReactProp(name = "data")
  public void setData(RecyclerView recyclerView, ReadableArray data) {
    images.clear();
    for (int i = 0; i < data.size(); i++) {
      images.addLast(data.getString(i));
    }
    LinearLayoutManager manager = new LinearLayoutManager(reactContext, RecyclerView.HORIZONTAL, false);
    recyclerView.setLayoutManager(manager);
    adapter = new SliderAdapter(reactContext, images);
    recyclerView.setAdapter(adapter);
    recyclerView.scrollBy(1,0);
  }

  @Override
  public Map getExportedCustomBubblingEventTypeConstants() {
    return MapBuilder.builder()
      .put(
        "topChange",
        MapBuilder.of("phasedRegistrationNames", MapBuilder.of("bubbled", "onChange"))
      )
      .build();
  }
}
