package com.keepcoding.nutris.ui.screens.register

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.Email
import androidx.compose.material.icons.outlined.Lock
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.keepcoding.nutris.R
import com.keepcoding.nutris.ui.NutrisScreen
import com.keepcoding.nutris.ui.common.ButtonMixedText
import com.keepcoding.nutris.ui.theme.OutlinedTextFieldShape
import com.keepcoding.nutris.ui.theme.PrimaryColorLight

@Composable
fun Register01Screen(onNextClicked: () -> Unit) {
    var email by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }


    LazyColumn(modifier = Modifier.fillMaxSize()) {
        item {
            Spacer(modifier = Modifier.padding(top = 80.dp))
        }

        item {
            Column(
                horizontalAlignment = Alignment.CenterHorizontally
            ) {

                Text(
                    text = stringResource(R.string.app_name),
                    style = MaterialTheme.typography.h2
                )

                Spacer(modifier = Modifier.padding(top = 35.dp))

                Text(
                    text = stringResource(R.string.the_basics),
                    style = MaterialTheme.typography.h3,
                )

                Spacer(modifier = Modifier.padding(top = 8.dp))

                Text(
                    text = stringResource(R.string.lets_start_with_the_basics),
                    style = MaterialTheme.typography.body1,
                    modifier = Modifier.padding(end = 30.dp, start = 30.dp),
                    textAlign = TextAlign.Center
                )

                Spacer(modifier = Modifier.padding(top = 16.dp))

                OutlinedTextField(
                    value = email,
                    onValueChange = { email = it },
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
                    onValueChange = { password = it },
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

                Spacer(modifier = Modifier.padding(top = 8.dp))

                OutlinedTextField(
                    value = password,
                    onValueChange = { password = it },
                    label = { Text(stringResource(id = R.string.password)) },
                    placeholder = { Text(stringResource(id = R.string.repeat_your_password)) },
                    leadingIcon = {
                        Icon(
                            imageVector = Icons.Outlined.Lock,
                            contentDescription = "Lock Icon"
                        )
                    },
                    shape = OutlinedTextFieldShape
                )
            }

        }

        item {
            Spacer(modifier = Modifier.padding(top = 60.dp))
        }

        item {
            ButtonMixedText(
                buttonText = R.string.next,
                blackText = R.string.already_have_an_account,
                greenText = R.string.log_in,
                onButtonClicked = onNextClicked,
                onTextClicked = {}
            )
        }

        item {
            Spacer(modifier = Modifier.padding(top = 70.dp))
        }
    }

    Box(modifier = Modifier.fillMaxSize()) {
        Column(modifier = Modifier.align(Alignment.BottomCenter)) {

            LinearProgressIndicator(
                progress = 0.125f,
                modifier = Modifier
                    .fillMaxWidth()
                    .height(50.dp),
                backgroundColor = PrimaryColorLight
            )
        }
    }
}

@Preview
@Composable
fun Register01ScreenPreview() {
    NutrisScreen {
        Register01Screen {}
    }
}