package com.keepcoding.nutris.ui.screens.login

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.keepcoding.nutris.domain.Repository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.flowOn
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class LoginViewModel @Inject constructor(
    private val repository: Repository,
) : ViewModel() {

    private val _loginSuccess = MutableStateFlow(false)
    val loginSuccess: StateFlow<Boolean> get() = _loginSuccess

    private val _error = MutableStateFlow(false)
    val error: StateFlow<Boolean> get() = _error

    private val _token = MutableStateFlow("")
    val token: StateFlow<String> get() = _token

    fun login(email: String, password: String) {
        viewModelScope.launch {
            repository.login(email, password).flowOn(Dispatchers.IO).collect {
                it.onSuccess { _loginSuccess.value = true }
                it.onFailure { _error.value = true }
                _token.value = it.getOrThrow().accessToken
            }
        }
    }
}