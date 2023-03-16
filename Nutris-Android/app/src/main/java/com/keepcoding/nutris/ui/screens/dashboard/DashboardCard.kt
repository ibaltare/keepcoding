package com.keepcoding.nutris.ui.screens.dashboard

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Card
import androidx.compose.material.CircularProgressIndicator
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.constraintlayout.compose.ConstraintLayout
import coil.compose.AsyncImagePainter
import coil.compose.SubcomposeAsyncImage
import coil.compose.SubcomposeAsyncImageContent
import com.keepcoding.nutris.domain.Recipe
import com.keepcoding.nutris.ui.NutrisScreen

@Composable
fun DashboardCard(recipe: Recipe, onClick: (Int) -> Unit) {
    Card(
        elevation = 16.dp,
        shape = RoundedCornerShape(8.dp),
        modifier = Modifier
            .padding(bottom = 32.dp, start = 32.dp, end = 32.dp)
            .height(280.dp)
            .clickable(onClick = { onClick(1) })
    ) {
        ConstraintLayout {
            val (imageRef, titleRef, iconsRef,
                subtitleRef, contentRef) = createRefs()

            SubcomposeAsyncImage(model = "http://10.0.2.2:8080"+recipe.photo,
                contentDescription = null,
                contentScale = ContentScale.FillWidth,
                modifier = Modifier
                    .constrainAs(imageRef) {
                        top.linkTo(parent.top)
                        start.linkTo(parent.start)
                        end.linkTo(parent.end)
                    }
                    .height(100.dp)) {
                val state = painter.state
                if (state is AsyncImagePainter.State.Loading || state is AsyncImagePainter.State.Error) {
                    CircularProgressIndicator()
                } else {
                    SubcomposeAsyncImageContent()
                }
            }

            Text(text = recipe.title,
                style = MaterialTheme.typography.h3,
                overflow = TextOverflow.Ellipsis,
                maxLines = 1,
                modifier = Modifier
                    .width(180.dp)
                    .constrainAs(titleRef) {
                        top.linkTo(imageRef.bottom, margin = 8.dp)
                        start.linkTo(parent.start, margin = 8.dp)
                    })

            DashboardIcons(modifier = Modifier.constrainAs(iconsRef) {
                top.linkTo(titleRef.top)
                bottom.linkTo(titleRef.bottom)
                start.linkTo(titleRef.end, margin = 4.dp)
            })

            Text(text = recipe.food,
                style = MaterialTheme.typography.body1,
                modifier = Modifier
                    .constrainAs(subtitleRef) {
                        top.linkTo(titleRef.bottom, margin = 8.dp)
                        start.linkTo(parent.start, margin = 8.dp)
                    })


            Text(text = recipe.desc,
                style = MaterialTheme.typography.body1,
                overflow = TextOverflow.Ellipsis,
                maxLines = 3,
                modifier = Modifier
                    .padding(8.dp)
                    .constrainAs(contentRef) {
                        top.linkTo(subtitleRef.bottom)
                        start.linkTo(parent.start)
                        end.linkTo(parent.end)
                    })
        }
    }
}

@Preview
@Composable
fun DashboardCardPreview() {
    NutrisScreen {
        //DashboardCard{}
    }
}