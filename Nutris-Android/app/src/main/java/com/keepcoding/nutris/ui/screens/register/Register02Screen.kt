package com.keepcoding.nutris.ui.screens.register

import androidx.annotation.DrawableRes
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.Email
import androidx.compose.material.icons.outlined.Lock
import androidx.compose.material.icons.outlined.Person
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.keepcoding.nutris.R
import com.keepcoding.nutris.ui.NutrisScreen
import com.keepcoding.nutris.ui.common.ButtonMixedText
import com.keepcoding.nutris.ui.common.OutlinedSpinner
import com.keepcoding.nutris.ui.theme.OutlinedTextFieldShape
import com.keepcoding.nutris.ui.theme.PrimaryColorLight

@Composable
fun Register02Screen(onNextClicked: () -> Unit) {
    val painter = painterResource(id = R.drawable.global)
    var name by remember { mutableStateOf("") }

    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
    ) {
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
            }
        }

        item {
            Image(
                modifier = Modifier
                    .aspectRatio(painter.intrinsicSize.width / painter.intrinsicSize.height)
                    .fillMaxWidth()
                    .padding(horizontal = 20.dp),
                painter = painter,
                contentScale = ContentScale.Fit,
                contentDescription = null
            )
        }

        item {
            Spacer(modifier = Modifier.padding(top = 15.dp))
        }

        item {
            Column(
                modifier = Modifier.fillMaxWidth(),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text(stringResource(id = R.string.full_name)) },
                    placeholder = { Text(stringResource(id = R.string.your_full_name)) },
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
                    label = R.string.country,
                    leadingIcon = R.drawable.address_icon,
                    listItems = listOf("Uruguay", "Argentina", "Brasil", "Mexico")
                )
            }
        }
        item {

            Spacer(modifier = Modifier.padding(top = 25.dp))

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
                progress = 0.25f,
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
fun Register02ScreenPreview() {
    NutrisScreen {
        Register02Screen {}
    }
}