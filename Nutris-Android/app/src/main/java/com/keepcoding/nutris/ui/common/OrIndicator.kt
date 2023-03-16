package com.keepcoding.nutris.ui.common

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Divider
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.keepcoding.nutris.R
import com.keepcoding.nutris.ui.NutrisScreen

@Composable
fun OrIndicator() {
    Row(verticalAlignment = Alignment.CenterVertically) {
        Divider(
            color = Color.Black, thickness = 1.dp,
            modifier = Modifier
                .weight(0.4f)
                .padding(start = 70.dp)
        )

        Text(
            text = stringResource(id = R.string.or),
            modifier = Modifier.weight(0.2f),
            textAlign = TextAlign.Center
        )

        Divider(
            color = Color.Black, thickness = 1.dp,
            modifier = Modifier
                .weight(0.4f)
                .padding(end = 70.dp)
        )
    }
}

@Preview
@Composable
fun OrIndicatorPreview() {
    NutrisScreen {
        OrIndicator()
    }
}