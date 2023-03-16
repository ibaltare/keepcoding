package com.keepcoding.nutris.ui.screens.dashboard

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.Lock
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.constraintlayout.compose.ConstraintLayout
import coil.compose.AsyncImagePainter
import coil.compose.SubcomposeAsyncImage
import coil.compose.SubcomposeAsyncImageContent
import com.keepcoding.nutris.R
import com.keepcoding.nutris.ui.NutrisScreen
import com.keepcoding.nutris.ui.theme.Body4
import com.keepcoding.nutris.ui.theme.OutlinedTextFieldShape
import com.keepcoding.nutris.ui.theme.PrimaryColorLight

@Composable
fun DashboardDetailScreen() {

    val steps = listOf(
        StepItem(
            "1",
            "To prepare this amazing vegetarian recipe, take the fish fillets and massage it gently with oil, keep aside in a plate."
        ),
        StepItem(
            "2",
            "Grind together the garlic, turmeric powder, red chill powder, green chillies, dill leaves, coriander powder, and salt. Add oil to it and grind to form paste. Rub this all over the fish fillets and keep aside to marinate for 15 to 30 munutes"
        ),
        StepItem(
            "3",
            "Grill the marinated fish on a preheated grill or oven till golden and crisp on both sides or for 5 minutes. Transfer to a plate."
        )
    )

    LazyColumn {
        item {
            ConstraintLayout {

                val (imageRef, hearRef) = createRefs()

                SubcomposeAsyncImage(
                    model = "https://static.onecms.io/wp-content/uploads/sites/43/2023/01/12/270770-garlic-noodles-ddmfs-4x3-0189.jpg",
                    contentDescription = null,
                    contentScale = ContentScale.FillWidth,
                    modifier = Modifier
                        .constrainAs(imageRef) {
                            top.linkTo(parent.top)
                            start.linkTo(parent.start)
                            end.linkTo(parent.end)
                        }
                        .height(200.dp)
                ) {
                    val state = painter.state
                    if (state is AsyncImagePainter.State.Loading || state is AsyncImagePainter.State.Error) {
                        CircularProgressIndicator()
                    } else {
                        SubcomposeAsyncImageContent()
                    }
                }

                Image(
                    painter = painterResource(id = R.drawable.not_favorite_icon),
                    contentDescription = null,
                    modifier = Modifier
                        .constrainAs(hearRef) {
                            top.linkTo(imageRef.top, margin = 16.dp)
                            end.linkTo(imageRef.end, margin = 16.dp)
                        }
                        .size(40.dp)
                )

            }
        }

        item {
            Spacer(modifier = Modifier.padding(top = 16.dp))
            DashboardIcons(modifier = Modifier.fillMaxWidth())
        }

        item {
            Spacer(modifier = Modifier.padding(top = 16.dp))

            ConstraintLayout(modifier = Modifier.fillMaxWidth()) {
                val (titleRef, bookmarkRef) = createRefs()
                Text(text = "Noodles & Vegs",
                    style = MaterialTheme.typography.h3,
                    overflow = TextOverflow.Ellipsis,
                    maxLines = 1,
                    modifier = Modifier
                        .constrainAs(titleRef) {
                            top.linkTo(parent.top)
                            start.linkTo(parent.start)
                            end.linkTo(parent.end)
                        }
                        .width(250.dp)
                )

                Image(
                    painter = painterResource(id = R.drawable.bookmark_icon),
                    contentDescription = null,
                    modifier = Modifier
                        .constrainAs(bookmarkRef) {
                            top.linkTo(titleRef.top)
                            bottom.linkTo(titleRef.bottom)
                            end.linkTo(parent.end, margin = 16.dp)
                        }
                        .size(25.dp)
                )
            }


            Text(
                text = "Noodles & Vegs is a delicious Mediterranean recipe made by marinating fish fillets in garlic, green chilies and blend of spices. Tender fish fillets smeared in a simple marinade of lime juice and salt, seared golden. Delicious, isn’t it?",
                style = MaterialTheme.typography.body1,
                modifier = Modifier
                    .padding(8.dp)
            )
        }


        item {
            Text(
                text = "Ingredients",
                style = MaterialTheme.typography.h3,
                modifier = Modifier
                    .padding(8.dp)
            )

            Text(
                text = "Fish 250gm\n" +
                        "Lemon Juice 3 tbsp\n" +
                        "Cabbage 50 gm\n" +
                        "Noodles 500 gm\n" +
                        "Vegs 5",
                style = MaterialTheme.typography.body1,
                modifier = Modifier
                    .padding(8.dp)
            )
        }

        item {
            Text(
                text = "Steps",
                style = MaterialTheme.typography.h3,
                modifier = Modifier
                    .padding(8.dp)
            )
        }

        items(items = steps, key = { step -> step.number }) { step ->
            Row {
                Text(
                    text = "Step",
                    style = Body4,
                    modifier = Modifier
                        .padding(horizontal = 8.dp)
                )

                Box(
                    modifier = Modifier
                        .size(24.dp)
                        .clip(CircleShape)
                        .background(color = PrimaryColorLight),
                    contentAlignment = Alignment.Center
                ) {
                    Text(text = step.number, style = Body4)
                }
            }

            Text(
                text = step.content,
                style = MaterialTheme.typography.body1,
                modifier = Modifier
                    .padding(8.dp)
            )

            Spacer(modifier = Modifier.padding(bottom = 8.dp))
        }

        item {

            ConstraintLayout(modifier = Modifier.fillMaxWidth()) {
                val (likeRef, starsRef, commentsRef) = createRefs()

                Text(
                    text = "Do you like the recipe?",
                    style = Body4,
                    modifier = Modifier.constrainAs(likeRef) {
                        start.linkTo(parent.start, margin = 8.dp)
                        top.linkTo(parent.top)
                    }
                )

                Row(modifier = Modifier.constrainAs(starsRef) {
                    start.linkTo(likeRef.end, margin = 8.dp)
                    top.linkTo(likeRef.top)
                    bottom.linkTo(likeRef.bottom)
                }) {
                    Image(
                        painter = painterResource(id = R.drawable.star_icon),
                        contentDescription = null,
                        modifier = Modifier
                            .size(30.dp)
                    )
                    Image(
                        painter = painterResource(id = R.drawable.star_icon),
                        contentDescription = null,
                        modifier = Modifier
                            .size(30.dp)
                    )
                    Image(
                        painter = painterResource(id = R.drawable.star_icon),
                        contentDescription = null,
                        modifier = Modifier
                            .size(30.dp)
                    )
                }

                OutlinedTextField(
                    value = "",
                    onValueChange = { },
                    shape = OutlinedTextFieldShape,
                    modifier = Modifier
                        .padding(8.dp)
                        .constrainAs(commentsRef) {
                            top.linkTo(likeRef.bottom)
                            start.linkTo(parent.start)
                            end.linkTo(parent.end)
                        }
                        .fillMaxWidth()
                        .height(100.dp)
                )
            }

        }

        item {
            Text(
                text = "Upload photo & win points",
                style = MaterialTheme.typography.body2,
                modifier = Modifier
                    .padding(8.dp)
                    .fillMaxWidth(),
                textAlign = TextAlign.Center
            )

            Spacer(modifier = Modifier.padding(bottom = 24.dp))
        }
    }
}

@Preview
@Composable
fun DashboardDetailScreenPreview() {
    NutrisScreen {
        DashboardDetailScreen()
    }
}