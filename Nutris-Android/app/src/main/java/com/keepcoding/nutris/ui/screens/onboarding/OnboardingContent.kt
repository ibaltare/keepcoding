package com.keepcoding.nutris.ui.screens.onboarding

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
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

@Composable
fun OnboardingContent(
    @DrawableRes image: Int,
    @StringRes title: Int,
    @StringRes content: Int
) {
    val painter = painterResource(id = image)

    Column(
        modifier = Modifier.height(500.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Spacer(modifier = Modifier.padding(top = 80.dp))

        Text(
            text = stringResource(R.string.app_name),
            style = MaterialTheme.typography.h2
        )

        Image(
            modifier = Modifier
                .weight(1f, fill = false)
                .aspectRatio(painter.intrinsicSize.width / painter.intrinsicSize.height)
                .fillMaxWidth()
                .padding(horizontal = 20.dp),
            painter = painter,
            contentScale = ContentScale.Fit,
            contentDescription = null
        )

        Spacer(modifier = Modifier.padding(top = 8.dp))

        Text(
            text = stringResource(title),
            style = MaterialTheme.typography.h3,
        )

        Spacer(modifier = Modifier.padding(top = 8.dp))

        Text(
            text = stringResource(content),
            style = MaterialTheme.typography.body1,
            modifier = Modifier.padding(horizontal = 30.dp),
            textAlign = TextAlign.Center
        )

    }
}

@Preview
@Composable
fun OnboardingContentPreview() {
    NutrisScreen {
        OnboardingContent(R.drawable.eating, R.string.eat_healthy, R.string.maintaining_good_health)
    }
}