package com.keepcoding.nutris.ui.screens.dashboard

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.Icon
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import androidx.constraintlayout.compose.ConstraintLayout
import com.keepcoding.nutris.R

@Composable
fun DashboardScreen(
    token: String,
    onClick: (Int) -> Unit,
    dashboardViewModel: DashboardViewModel
) {
    dashboardViewModel.getRecipes(token)
    val recipes = dashboardViewModel.recipes.collectAsState()

    Column {

        ConstraintLayout(
            Modifier
                .fillMaxWidth()
                .padding(vertical = 24.dp)
        ) {

            val (arrowLeft, arrowRight, day) = createRefs()

            Icon(
                painter = painterResource(id = R.drawable.arrow_left_icon),
                contentDescription = null,
                modifier = Modifier
                    .padding(horizontal = 8.dp)
                    .size(25.dp)
                    .constrainAs(arrowLeft) {
                        bottom.linkTo(day.bottom)
                        top.linkTo(day.top)
                        end.linkTo(day.start)
                    }
            )

            Text(
                text = "Sunday",
                style = MaterialTheme.typography.h3,
                maxLines = 1,
                modifier = Modifier
                    .constrainAs(day) {
                        top.linkTo(parent.top)
                        start.linkTo(parent.start)
                        end.linkTo(parent.end)
                    }
            )

            Icon(
                painter = painterResource(id = R.drawable.arrow_right_icon),
                contentDescription = null,
                modifier = Modifier
                    .padding(horizontal = 8.dp)
                    .size(25.dp)
                    .constrainAs(arrowRight) {
                        bottom.linkTo(day.bottom)
                        top.linkTo(day.top)
                        start.linkTo(day.end)
                    }
            )

        }
        LazyColumn {
            items(recipes.value){ DashboardCard(it,onClick) }
        }
    }
}