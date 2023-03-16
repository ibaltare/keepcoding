package com.keepcoding.nutris.ui.screens.login

import androidx.compose.foundation.Image
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import com.keepcoding.nutris.R
import com.keepcoding.nutris.ui.common.FacebookSignInButton
import com.keepcoding.nutris.ui.common.GoogleSignInButton
import com.keepcoding.nutris.ui.common.MixedColorText
import com.keepcoding.nutris.ui.common.OrIndicator

@Composable
fun LoginChooseScreen(onEmailClick: () -> Unit, onSignUpClick: () -> Unit) {
    val painter = painterResource(id = R.drawable.login)
    LazyColumn {
        item {
            Column(
                modifier = Modifier.fillMaxWidth(),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Spacer(modifier = Modifier.padding(top = 80.dp))

                Text(
                    text = stringResource(R.string.app_name),
                    style = MaterialTheme.typography.h2,
                )

            }
        }

        item {
            Image(
                modifier = Modifier
                    .aspectRatio(painter.intrinsicSize.width / painter.intrinsicSize.height)
                    .fillMaxWidth()
                    .padding(horizontal = 40.dp),
                painter = painter,
                contentScale = ContentScale.Fit,
                contentDescription = null
            )
        }

        item {
            GoogleSignInButton()
        }

        item {
            Spacer(modifier = Modifier.padding(top = 16.dp))
        }

        item {
            FacebookSignInButton()
        }

        item {
            Spacer(modifier = Modifier.padding(top = 32.dp))
        }

        item {
            OrIndicator()
        }

        item {
            Spacer(modifier = Modifier.padding(top = 32.dp))
        }

        item {
            Column(
                modifier = Modifier.fillMaxWidth(),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(
                    text = stringResource(id = R.string.login_with_email_address),
                    style = MaterialTheme.typography.body2,
                    textAlign = TextAlign.Center,
                    modifier = Modifier.clickable {
                        onEmailClick()
                    }
                )
            }
        }

        item {
            Spacer(modifier = Modifier.padding(top = 16.dp))
        }

        item {
            Column(
                modifier = Modifier.fillMaxWidth(),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                MixedColorText(
                    blackText = R.string.do_not_have_an_account,
                    greenText = R.string.sing_up,
                    onClick = onSignUpClick
                )
            }
        }

        item {
            Spacer(modifier = Modifier.padding(top = 25.dp))
        }
    }
}
