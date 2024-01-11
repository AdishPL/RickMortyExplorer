//
//  CharactersFilteringView.swift
//  RickMortyExplorer
//
//  Created by Adrian Kaczmarek on 10/01/2024.
//

import SwiftUI
import Theming
import Localization

struct CharactersFilteringView: View {
    @Binding var isPresented: Bool
    @StateObject var viewModel: CharacterFilteringViewModel

    var body: some View {
        NavigationView {
            ZStack {
                Color(.BackgroundDefault)
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 30) {
                    // TODO: Refactor to loop through available categories of filtering
                    GroupHeaderView(title: LocalizedString(key: .filterStatus).value,
                                    selectedOption: $viewModel.currentFilters.selectedStatus) {
                        VStack(alignment: .leading, spacing: 14) {
                            ForEach(StatusFilter.allCases, id: \.self) { status in
                                OptionRowView(
                                    text: LocalizedString(key: status.appLocalizedKey).value,
                                    isSelected: viewModel.currentFilters.selectedStatus == status,
                                    action: { viewModel.toggleSelection(option: status, currentSelection: $viewModel.currentFilters.selectedStatus) }
                                )
                            }
                        }
                    }
                    GroupHeaderView(title: LocalizedString(key: .filterGender).value,
                                    selectedOption: $viewModel.currentFilters.selectedGender) {
                        VStack(alignment: .leading, spacing: 14) {
                            ForEach(GenderFilter.allCases, id: \.self) { gender in
                                OptionRowView(
                                    text: LocalizedString(key: gender.appLocalizedKey).value,
                                    isSelected: viewModel.currentFilters.selectedGender == gender,
                                    action: { viewModel.toggleSelection(option: gender, currentSelection: $viewModel.currentFilters.selectedGender) }
                                )
                            }
                        }
                    }
                    Spacer()
                    Button(action: {
                        viewModel.applyFiltering()
                        isPresented = false
                    }) {
                        Text(.filterApplyButton)
                            .styledToTypography(.subtitle1)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.TextPrimary)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(.Border), lineWidth: 1)
                    )
                    .buttonStyle(.plain)
                }
                .padding()
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.TextPrimary)
                    }
                }
            }
            .navigationTitle(.filterTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
