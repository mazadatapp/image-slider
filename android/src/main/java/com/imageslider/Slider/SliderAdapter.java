package com.imageslider.Slider;

import android.content.Context;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.imageslider.R;
import com.jsibbold.zoomage.ZoomageView;
import com.squareup.picasso.Picasso;

import java.io.File;
import java.util.LinkedList;

public class SliderAdapter extends RecyclerView.Adapter<SliderAdapter.Holder> {
  LinkedList<String> list;
  Context context;

  public SliderAdapter(Context context, LinkedList<String> list) {
    this.list = list;
    this.context = context;
  }

  @NonNull
  @Override
  public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
    View view = LayoutInflater.from(context).inflate(R.layout.adapter_image_slider_item, parent, false);
    return new Holder(view);
  }

  @Override
  public void onBindViewHolder(@NonNull Holder holder, int position) {
    holder.onBind(list.get(position));
  }

  @Override
  public int getItemCount() {
    return list.size();
  }

  class Holder extends RecyclerView.ViewHolder {
    ZoomageView image;

    public Holder(@NonNull View itemView) {
      super(itemView);
      image = itemView.findViewById(R.id.image);

    }

    public void onBind(String imageUrl) {
      if (imageUrl.contains("https://") || imageUrl.contains("http://")) {
        Picasso.get().load(imageUrl).into(image);
      } else {
        image.setImageURI(Uri.fromFile(new File(imageUrl)));
      }
    }
  }
}
