//
//  Location.swift
//  Map
//
//  Created by Agnesa  on 23.5.23.
//



//import SwiftUI
//
//struct LocationsView: View {
//
//    @EnvironmentObject var vm: LocationsViewModel
//
//    var body: some View {
//        List{
//            ForEach(vm.locations){ location in
//                Text(location.name)
//            }
//        }
//
//    }
//}
//
//struct LocationView_Previews: PreviewProvider {
//    static var previews: some View {
//        let vm = LocationsViewModel()
//        LocationsView()
//            .environmentObject(vm)
//    }
//}
import SwiftUI
import MapKit
import UIKit


struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {

          mapLayer
                .ignoresSafeArea()
            
            
            VStack(spacing: 0){
               header
                .padding()
                
                Spacer()
                locationPreviewStack
                
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }.environmentObject(vm)
            .onAppear {
            _ = UIApplication.shared.delegate as? AppDelegate
            // Access and use appDelegate here
        }
    }
}

struct Location_Previews: PreviewProvider {
    static var previews: some View {
        let vm = LocationsViewModel()
        LocationView().environmentObject(vm)
    }
}

extension LocationView{
    private var header: some View{
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black).foregroundColor(.primary)
                    .frame(height: 55)
                .frame(maxWidth: .infinity)
                .animation(.none, value: vm.mapLocation)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                        .rotationEffect(Angle(degrees: vm.showLocationList ? 180 : 0))
                }
            }
            if vm.showLocationList{
                LocationListView()
            }
          
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x:0, y: 15)
    }
    
    private var mapLayer: some View{
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates){
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        }).environmentObject(vm)
    }
    private var locationPreviewStack: some View{
        ZStack{
            ForEach(vm.locations) { location in
                if vm.mapLocation == location{
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
                }
                
            }
        }.environmentObject(vm)
    }
}
