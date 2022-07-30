//
//  AvatarPickerView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/26/22.
//

import SwiftUI

struct AvatarPickerView: View {
    
    let size: Double = 20
    @State private var appear = [false,false, false]
    @Binding var image: UIImage?
    @State private var showGallerySheet = false
    @State private var showCameraSheet = false
    @State private var isShowingConfirmationDialog = false
    
    var body: some View {
        VStack {
            Text("Create an Avatar")
                .font(.title.bold())
                .multilineTextAlignment(.center)
                .offset(y: appear[0] ? 0 : -120)
                .opacity(appear[0] ? 1 : 0)
                .padding(.bottom)
            
            Text("Help us to create your \npersonalized plan")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .offset(y: appear[1] ? 0 : 120)
                .opacity(appear[1] ? 1 : 0)
                .padding(.bottom, 48)
            
            AvatarButton()
        }
        .confirmationDialog("Choose your profile image", isPresented: $isShowingConfirmationDialog, titleVisibility: .visible){
            Button("Camera") {
                showCameraSheet = true
            }
            
            Button("Gallery") {
                showGallerySheet = true
            }
        }
        .sheet(isPresented: $showGallerySheet) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
            
        }
        .sheet(isPresented: $showCameraSheet) {
            ImagePicker(sourceType: .camera, selectedImage: $image)
            
        }
        .onAppear {
            withAnimation(.easeOut.delay(0.3)) {
                appear[0] = true
            }
            withAnimation(.easeOut.delay(0.4)) {
                appear[1] = true
            }
            withAnimation(.spring().delay(0.6)) {
                appear[2] = true
            }
        }
        .onDisappear {
            appear[0] = false
            appear[1] = false
            appear[2] = false
        }
    }
     
    @ViewBuilder func AvatarButton() -> some View {
        Button {
            isShowingConfirmationDialog = true
       
        } label: {
            if image == nil {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(y: 10)
            }
            else {
                Image(uiImage: image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .frame(width: 150, height: 150)
        .background(kGradient2)
        .clipShape(Circle())
        .contextMenu {
            Button(role: .destructive) { image = nil } label: {
                Label("Delete", systemImage: "trash.fill")
                
            }
        }
        .shadow(radius: 10)
        .foregroundColor(.black.opacity(0.6))
        .offset(y: appear[2] ? 0 : 150)
        .opacity(appear[2] ? 1 : 0)
        
    }
}

struct AvatarPickerView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarPickerView(image: .constant(nil)).preferredColorScheme(.light)
    }
}
