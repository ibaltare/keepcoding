package com.keepcoding.nutris.ui.common

import androidx.annotation.StringRes
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.padding
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun ButtonMixedText(
    @StringRes buttonText: Int,
    @StringRes blackText: Int,
    @StringRes greenText: Int,
    modifier: Modifier = Modifier,
    onButtonClicked: () -> Unit,
    onTextClicked: () -> Unit,

) {
    Column(modifier = modifier,
        horizontalAlignment = Alignment.CenterHorizontally) {
        GenericButton(text = buttonText, onClick = onButtonClicked)

        Spacer(modifier = Modifier.padding(10.dp))

        MixedColorText(blackText = blackText, greenText = greenText, onClick = onTextClicked)
    }
}