package com.keepcoding.nutris.ui.screens.login

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.Email
import androidx.compose.material.icons.outlined.Lock
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.keepcoding.nutris.R
import com.keepcoding.nutris.ui.common.MixedColorText
import com.keepcoding.nutris.ui.theme.ButtonCornerShape
import com.keepcoding.nutris.ui.theme.OutlinedTextFieldShape

@Composable
fun LoginEmailScreen(
    onLoginClick: (String) -> Unit,
    onSignUpClick: () -> Unit,
    onLoginError: () -> Unit,
    loginViewModel: LoginViewModel = hiltViewModel()
) {
    var email by rememberSaveable() { mutableStateOf("") }
    var password by rememberSaveable() { mutableStateOf("") }
    var passwordValid by rememberSaveable() { mutableStateOf(false) }
    var emailValid by rememberSaveable() { mutableStateOf(false) }
    val loginEnabled by remember {
        derivedStateOf { passwordValid && emailValid }
    }

    val success by loginViewModel.loginSuccess.collectAsState()
    val error by loginViewModel.error.collectAsState()
    val token by loginViewModel.token.collectAsState()

    LaunchedEffect(success) {
        if (success) {
            onLoginClick(token)
        }
    }
    LaunchedEffect(error) {
        if (error) {
            onLoginError()
        }
    }

    LazyColumn(horizontalAlignment = Alignment.CenterHorizontally) {
        item {
            FormField(
                email = email,
                password = password,
                loginEnabled = loginEnabled,
                onEmailChange = {
                    email = it
                    emailValid = it.contains("@") && it.length > 10
                },
                onPasswordChange = {
                    password = it
                    passwordValid = it.length > 5
                },
                onLoginClick = { loginViewModel.login(email, password) }
            )
        }

        item {
            Spacer(modifier = Modifier.padding(25.dp))
        }

        item {
            MixedColorText(
                blackText = R.string.do_not_have_an_account,
                greenText = R.string.sing_up,
                onSignUpClick
            )
        }
    }
}

@Composable
fun FormField(
    email: String,
    password: String,
    onEmailChange: (String) -> (Unit),
    onPasswordChange: (String) -> (Unit),
    onLoginClick: () -> Unit,
    loginEnabled: Boolean
) {

    Column(
        modifier = Modifier.fillMaxWidth(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Spacer(modifier = Modifier.padding(top = 80.dp))

        Text(
            text = stringResource(R.string.app_name),
            style = MaterialTheme.typography.h2,
        )

        Spacer(modifier = Modifier.padding(top = 40.dp))

        OutlinedTextField(
            value = email,
            onValueChange = onEmailChange,
            label = { Text(stringResource(id = R.string.email_address)) },
            placeholder = { Text(stringResource(id = R.string.your_email_address)) },
            leadingIcon = {
                Icon(
                    imageVector = Icons.Outlined.Email,
                    contentDescription = "Email Icon"
                )
            },
            shape = OutlinedTextFieldShape
        )

        Spacer(modifier = Modifier.padding(top = 16.dp))

        OutlinedTextField(
            value = password,
            onValueChange = onPasswordChange,
            label = { Text(stringResource(id = R.string.password)) },
            placeholder = { Text(stringResource(id = R.string.your_password)) },
            leadingIcon = {
                Icon(
                    imageVector = Icons.Outlined.Lock,
                    contentDescription = "Lock Icon"
                )
            },
            shape = OutlinedTextFieldShape
        )

        Spacer(modifier = Modifier.padding(top = 32.dp))

        MixedColorText(
            blackText = R.string.forgot_password,
            greenText = R.string.recover,
            onClick = {})

        Spacer(modifier = Modifier.padding(top = 30.dp))

        LoginButton(text = "Login", onLoginClick = onLoginClick, loginEnabled)
    }
}

@Composable
fun LoginButton(text: String, onLoginClick: () -> Unit, loginEnabled: Boolean) {
    Button(
        onClick = onLoginClick,
        shape = ButtonCornerShape,
        enabled = loginEnabled,
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 80.dp)
    ) {
        Text(
            text = text,
            modifier = Modifier.padding(horizontal = 15.dp, vertical = 5.dp)
        )
    }
}
