package com.keepcoding.nutris.ui.common

import androidx.annotation.StringRes
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Button
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import com.keepcoding.nutris.ui.theme.ButtonCornerShape

@Composable
fun GenericButton(@StringRes text: Int, onClick: () -> Unit) {
    Button(
        onClick = { onClick() },
        shape = ButtonCornerShape,
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 80.dp)
    ) {
        Text(
            text = stringResource(id = text),
            modifier = Modifier.padding(horizontal = 15.dp, vertical = 5.dp)
        )
    }
}