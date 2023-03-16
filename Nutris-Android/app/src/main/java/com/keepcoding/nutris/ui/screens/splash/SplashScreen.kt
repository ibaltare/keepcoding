package com.keepcoding.nutris.ui.screens.splash

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.keepcoding.nutris.R
import com.keepcoding.nutris.ui.NutrisScreen
import com.keepcoding.nutris.ui.theme.PrimaryColor
import kotlinx.coroutines.delay

@Composable
fun SplashScreen(onTimeFinished: () -> Unit) {
    LaunchedEffect(Unit) {
        delay(2000L)
        onTimeFinished()
    }

    val painter = painterResource(id = R.drawable.balance)

    Column(
        modifier  = Modifier
            .fillMaxSize()
            .background(color = PrimaryColor),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Spacer(modifier = Modifier.padding(top = 100.dp))

        Text(
            text = stringResource(R.string.app_name),
            style = MaterialTheme.typography.h1,
        )

        Image(
            modifier = Modifier
                .weight(1f, fill = false)
                .aspectRatio(painter.intrinsicSize.width / painter.intrinsicSize.height)
                .fillMaxWidth()
                .padding(horizontal = 60.dp),
            painter = painter,
            contentScale = ContentScale.Fit,
            contentDescription = null
        )

        Spacer(modifier = Modifier.padding(top = 100.dp))

        Text(
            text = stringResource(R.string.healthy_habits),
            style = MaterialTheme.typography.h4,
        )
    }
}

@Preview
@Composable
fun SplashScreenPreview() {
    NutrisScreen {
        SplashScreen{}
    }
}