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
fun Register08Screen(onFinishClicked: () -> Unit) {
    val painter = painterResource(id = R.drawable.high_five)

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
                    text = stringResource(R.string.all_ready),
                    style = MaterialTheme.typography.h3,
                )

                Spacer(modifier = Modifier.padding(top = 8.dp))

                Text(
                    text = stringResource(R.string.your_plan_has_been_configured),
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
            Spacer(modifier = Modifier.padding(top = 15.dp))
        }

        item {

            Spacer(modifier = Modifier.padding(top = 40.dp))

            ButtonMixedText(
                buttonText = R.string.finish,
                blackText = R.string.complete_later,
                greenText = R.string.skip,
                onButtonClicked = onFinishClicked,
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
                progress = 1f,
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
fun Register08ScreenPreview() {
    NutrisScreen {
        Register08Screen {}
    }
}