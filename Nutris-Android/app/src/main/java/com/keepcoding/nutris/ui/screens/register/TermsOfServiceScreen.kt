package com.keepcoding.nutris.ui.screens.register

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.*
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
import com.keepcoding.nutris.ui.theme.PrimaryColorLight

@Composable
fun TermsOfServiceScreen(onAcceptClicked: () -> Unit) {
    val painter = painterResource(id = R.drawable.terms_of_service)

    LazyColumn(modifier = Modifier.fillMaxSize()) {
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

                Spacer(modifier = Modifier.padding(top = 35.dp))

                Text(
                    text = stringResource(R.string.terms_of_service),
                    style = MaterialTheme.typography.h3,
                )

                Spacer(modifier = Modifier.padding(top = 8.dp))

                Text(
                    text = stringResource(R.string.before_we_continue),
                    style = MaterialTheme.typography.body1,
                    modifier = Modifier.padding(end = 30.dp, start = 30.dp),
                    textAlign = TextAlign.Center
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

            Spacer(modifier = Modifier.padding(top = 40.dp))

            ButtonMixedText(
                buttonText = R.string.accept,
                blackText = R.string.read,
                greenText = R.string.terms_of_service,
                onButtonClicked = onAcceptClicked,
                onTextClicked = {}
            )
        }

        item {
            Spacer(modifier = Modifier.padding(top = 70.dp))
        }
    }

}

@Preview
@Composable
fun TermsOfServiceScreenPreview() {
    NutrisScreen {
        TermsOfServiceScreen {}
    }
}