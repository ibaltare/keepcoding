package com.keepcoding.nutris.ui.screens.register

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.LinearProgressIndicator
import androidx.compose.material.MaterialTheme
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
import com.keepcoding.nutris.ui.common.ButtonMixedText
import com.keepcoding.nutris.ui.common.TextIconChip
import com.keepcoding.nutris.ui.theme.PrimaryColorLight

@Composable
fun Register06Screen(onNextClicked: () -> Unit) {
    val physicalLevels = listOf(
        ChipItem(R.drawable.light_icon, R.string.light),
        ChipItem(R.drawable.moderate_icon, R.string.moderate),
        ChipItem(R.drawable.heavy_icon, R.string.heavy)
    )
    LazyColumn {
        item { Spacer(modifier = Modifier.padding(top = 80.dp)) }
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
                    text = stringResource(R.string.what_is_your_level_of_physical_activity),
                    style = MaterialTheme.typography.h3,
                    textAlign = TextAlign.Center
                )
                Spacer(modifier = Modifier.padding(top = 16.dp))

            }
        }

        items(
            items = physicalLevels,
            key = { level ->
                level.text
            }
        ) { level ->
            TextIconChip(
                iconId = level.icon,
                tintColor = Color.Black,
                isSelected = false,
                text = level.text,
                onChecked = {},
                selectedColor = MaterialTheme.colors.primary
            )
            Spacer(modifier = Modifier.padding(top = 16.dp))
        }

        item {

            Spacer(modifier = Modifier.padding(top = 40.dp))

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
                progress = 0.75f,
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
fun Register06ScreenPreview() {
    NutrisScreen {
        Register06Screen{}
    }
}