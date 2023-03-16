package com.keepcoding.nutris.ui.screens.dashboard

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.keepcoding.nutris.domain.Recipe
import com.keepcoding.nutris.domain.Repository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import javax.inject.Inject

@HiltViewModel
class DashboardViewModel @Inject constructor(private val repository: Repository): ViewModel() {
    private val _recipes = MutableStateFlow(emptyList<Recipe>())
    val recipes: StateFlow<List<Recipe>> get() = _recipes

    fun getRecipes(token: String){
        viewModelScope.launch {
            withContext(Dispatchers.IO){
                repository.getRecipes(token).collect{
                    _recipes.value = it
                }
            }
        }
    }
}