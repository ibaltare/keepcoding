package com.keepcoding.nutris.ui.common

import androidx.annotation.StringRes
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.padding
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp

@Composable
fun MixedColorText(@StringRes blackText: Int, @StringRes greenText: Int, onClick:()->Unit){
    Row {
        Text(
            text = stringResource(id = blackText),
            style = MaterialTheme.typography.body1,
            textAlign = TextAlign.Center,
            modifier = Modifier.clickable{
                onClick()
            }
        )

        Spacer(modifier = Modifier.padding(2.dp))

        Text(
            text = stringResource(id = greenText),
            style = MaterialTheme.typography.body2,
            textAlign = TextAlign.Center,
            modifier = Modifier.clickable{
                onClick()
            }
        )
    }
}