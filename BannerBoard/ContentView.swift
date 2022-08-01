//
//  ContentView.swift
//  BannerBoard
//
//  Created by Chris Harper on 7/19/22.
//

import SwiftUI

struct ContentView: View {
	@State private var gridLayout: Bool = false
	@Namespace private var animation
	
	@State private var wallpaperCornerRadius: CGFloat = 40
	
	@State private var highlightOpacity: Double = 0.0
	
	var body: some View {
		chooserView
			.preferredColorScheme(.dark)
			.persistentSystemOverlays(.hidden)
	}
	
	var wallpaperWidth: CGFloat {
		gridLayout ? 95 : 250
	}
	
	var gridOffset: CGFloat {
		!gridLayout ? ((wallpaperWidth * 1.70)) : 0
	}
	
	var gridHorizontalSpacing: CGFloat {
		gridLayout ? 25 : 35
	}
	
	var chooserView: some View {
		VStack(spacing: 15) {
			Grid(horizontalSpacing: gridHorizontalSpacing, verticalSpacing: 70) {
				if !gridLayout {
					GridRow {
						Image("1")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.clipShape(RoundedRectangle(cornerRadius: wallpaperCornerRadius, style: .continuous))
							.transition(.scale(scale: 1, anchor: .center))
							.matchedGeometryEffect(id: 1, in: animation)
							.frame(width: wallpaperWidth)
						Image("0")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.clipShape(RoundedRectangle(cornerRadius: wallpaperCornerRadius, style: .continuous))
							.transition(.scale(scale: 1, anchor: .center))
							.overlay {
								RoundedRectangle(cornerRadius: wallpaperCornerRadius + 5, style: .continuous)
									.stroke(Color.accentColor.opacity(highlightOpacity), lineWidth: 5)
									.padding(-5)
							}
							.matchedGeometryEffect(id: 0, in: animation)
							.frame(width: wallpaperWidth)
						Image("2")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.clipShape(RoundedRectangle(cornerRadius: wallpaperCornerRadius, style: .continuous))
							.transition(.scale(scale: 1, anchor: .center))
							.matchedGeometryEffect(id: 2, in: animation)
							.frame(width: wallpaperWidth)
						Image("3")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.clipShape(RoundedRectangle(cornerRadius: wallpaperCornerRadius, style: .continuous))
							.transition(.scale(scale: 1, anchor: .center))
							.matchedGeometryEffect(id: 3, in: animation)
							.frame(width: wallpaperWidth)
						Image("4")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.clipShape(RoundedRectangle(cornerRadius: wallpaperCornerRadius, style: .continuous))
							.transition(.scale(scale: 1, anchor: .center))
							.matchedGeometryEffect(id: 4, in: animation)
							.frame(width: wallpaperWidth)
						Image("5")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.clipShape(RoundedRectangle(cornerRadius: wallpaperCornerRadius, style: .continuous))
							.transition(.scale(scale: 1, anchor: .center))
							.matchedGeometryEffect(id: 5, in: animation)
							.frame(width: wallpaperWidth)
					}
				} else {
					GridRow {
						Image("1")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.clipShape(RoundedRectangle(cornerRadius: wallpaperCornerRadius, style: .continuous))
							.transition(.scale(scale: 1, anchor: .center))
							.matchedGeometryEffect(id: 1, in: animation)
							.frame(width: wallpaperWidth)
						Image("0")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.clipShape(RoundedRectangle(cornerRadius: wallpaperCornerRadius, style: .continuous))
							.transition(.scale(scale: 1, anchor: .center))
							.overlay {
								RoundedRectangle(cornerRadius: wallpaperCornerRadius + 5, style: .continuous)
									.stroke(Color.accentColor.opacity(highlightOpacity), lineWidth: 5)
									.padding(-5)
							}
							.matchedGeometryEffect(id: 0, in: animation)
							.frame(width: wallpaperWidth)
						Image("2")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.clipShape(RoundedRectangle(cornerRadius: wallpaperCornerRadius, style: .continuous))
							.transition(.scale(scale: 1, anchor: .center))
							.matchedGeometryEffect(id: 2, in: animation)
							.frame(width: wallpaperWidth)
					}
					GridRow {
						Image("3")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.clipShape(RoundedRectangle(cornerRadius: wallpaperCornerRadius, style: .continuous))
							.transition(.scale(scale: 1, anchor: .center))
							.matchedGeometryEffect(id: 3, in: animation)
							.frame(width: wallpaperWidth)
						Image("4")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.clipShape(RoundedRectangle(cornerRadius: wallpaperCornerRadius, style: .continuous))
							.transition(.scale(scale: 1, anchor: .center))
							.matchedGeometryEffect(id: 4, in: animation)
							.frame(width: wallpaperWidth)
						Image("5")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.clipShape(RoundedRectangle(cornerRadius: wallpaperCornerRadius, style: .continuous))
							.transition(.scale(scale: 1, anchor: .center))
							.matchedGeometryEffect(id: 5, in: animation)
							.frame(width: wallpaperWidth)
					}
				}
				
			}
			.offset(x: gridOffset)
			buttonsStack
				.padding(.top, gridLayout ? 60 : 0)
				.frame(maxWidth: 350)
		}
		.padding(.top, 80)
	}
	
	var buttonsStack: some View {
		VStack(alignment: .center, spacing: 20) {
			circleStack
			HStack {
				Button {
					withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.5)) {
						gridLayout.toggle()
					}
					withAnimation(.easeInOut(duration: 0.3)) {
						wallpaperCornerRadius == 15 ? (wallpaperCornerRadius = 40) : (wallpaperCornerRadius = 15)
					}
					withAnimation(.easeInOut(duration: 0.3)) {
						highlightOpacity == 1.0 ? (highlightOpacity = 0.0) : (highlightOpacity = 1.0)
					}
				} label: {
					Image(systemName: !gridLayout ? "square.grid.2x2.fill" : "rectangle.portrait.inset.filled")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 30, height: 30)
						.symbolRenderingMode(.palette)
						.foregroundStyle(.white)
				}
				.frame(width: 45, height: 45)
				Spacer()
				Button {
					
				} label: {
					Text("Customize")
						.font(.headline)
						.frame(maxWidth: 150)
				}
				.tint(.secondary.opacity(0.35))
				.controlSize(.large)
				.buttonBorderShape(.roundedRectangle(radius: 15))
				.buttonStyle(.borderedProminent)
				Spacer(minLength: 0)
				Button {
					
				} label: {
					Image(systemName: "plus.circle.fill")
						.resizable()
						.font(.title2.weight(.light))
						.symbolRenderingMode(.palette)
						.foregroundStyle(.white, Color.accentColor)
				}
				.frame(width: 45, height: 45)
			}
		}
	}
	
	var circleStack: some View {
		HStack(spacing: 10) {
			ForEach(0...6, id: \.self) { index in
				Circle()
					.fill(index == 1 ? .white : .white.opacity(0.3))
					.frame(width: index == 4 ? 9 : index == 5 ? 6 : index == 6 ? 3 : 10)
			}
		}
		.opacity(gridLayout ? 0 : 1)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
