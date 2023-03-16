package com.keepcoding.nutris.ui.screens.register

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.Person
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.keepcoding.nutris.R
import com.keepcoding.nutris.ui.NutrisScreen
import com.keepcoding.nutris.ui.common.ButtonMixedText
import com.keepcoding.nutris.ui.common.OutlinedSpinner
import com.keepcoding.nutris.ui.theme.OutlinedTextFieldShape
import com.keepcoding.nutris.ui.theme.PrimaryColorLight

@Composable
fun Register03Screen(onNextClicked: () -> Unit) {
    var age by remember { mutableStateOf("") }
    var weight by remember { mutableStateOf("") }
    var height by remember { mutableStateOf("") }

    LazyColumn {
        item {
            Spacer(modifier = Modifier.padding(top = 80.dp))
        }

        item {
            Column(
                modifier = Modifier.fillMaxWidth(),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(
                    text = stringResource(R.string.app_name),
                    style = MaterialTheme.typography.h2
                )

                Spacer(modifier = Modifier.padding(top = 15.dp))

                OutlinedTextField(
                    value = age,
                    onValueChange = { age = it },
                    label = { Text(stringResource(id = R.string.age)) },
                    placeholder = { Text(stringResource(id = R.string.your_age)) },
                    leadingIcon = {
                        Icon(
                            imageVector = Icons.Outlined.Person,
                            contentDescription = "Person Icon"
                        )
                    },
                    shape = OutlinedTextFieldShape
                )

                Spacer(modifier = Modifier.padding(top = 8.dp))

                OutlinedSpinner(
                    label = R.string.gender,
                    leadingIcon = R.drawable.gender_icon,
                    listItems = listOf("Female", "Male", "Other")
                )

                Spacer(modifier = Modifier.padding(top = 8.dp))

                OutlinedTextField(
                    value = weight,
                    onValueChange = { weight = it },
                    label = { Text(stringResource(id = R.string.weight)) },
                    placeholder = { Text(stringResource(id = R.string.your_weight)) },
                    leadingIcon = {
                        Icon(
                            painter = painterResource(id = R.drawable.weight_kg_icon),
                            contentDescription = "Person Icon"
                        )
                    },
                    shape = OutlinedTextFieldShape
                )

                Spacer(modifier = Modifier.padding(top = 8.dp))

                OutlinedTextField(
                    value = height,
                    onValueChange = { height = it },
                    label = { Text(stringResource(id = R.string.height)) },
                    placeholder = { Text(stringResource(id = R.string.your_height)) },
                    leadingIcon = {
                        Icon(
                            painter = painterResource(id = R.drawable.height_cm_icon),
                            contentDescription = "Person Icon"
                        )
                    },
                    shape = OutlinedTextFieldShape
                )
            }
        }

        item {

            Spacer(modifier = Modifier.padding(top = 40.dp))

            ButtonMixedText(
                buttonText = R.string.next,
                blackText = R.string.complete_later,
                greenText = R.string.skip,
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
                progress = 0.375f,
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
fun Register03ScreenPreview() {
    NutrisScreen {
        Register03Screen{}
    }
}