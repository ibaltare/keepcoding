package com.keepcoding.nutris.ui.screens.dashboard

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material.Icon
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.keepcoding.nutris.R
import com.keepcoding.nutris.ui.NutrisScreen

@Composable
fun DashboardIcons(modifier: Modifier) {
    Row(modifier = modifier,
        horizontalArrangement = Arrangement.Center) {
        Icon(
            painter = painterResource(id = R.drawable.alarm_clock_icon),
            contentDescription = null,
            modifier = Modifier
                .size(25.dp)
        )

        Text(
            text = "30 min",
            style = MaterialTheme.typography.body1,
            modifier = Modifier.padding(start = 4.dp)
        )

        Icon(
            painter = painterResource(id = R.drawable.medium_level),
            contentDescription = null,
            modifier = Modifier
                .padding(start = 4.dp)
                .size(25.dp)
        )

        Icon(
            painter = painterResource(id = R.drawable.star_half_icon),
            contentDescription = null,
            modifier = Modifier
                .padding(start = 4.dp)
                .size(25.dp)
        )
    }

}

@Preview
@Composable
fun DashboardIconsPreview() {
    NutrisScreen {
        DashboardIcons(modifier = Modifier)
    }
}