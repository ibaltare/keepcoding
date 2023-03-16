package com.keepcoding.nutris.ui.common

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Color.Companion.DarkGray
import androidx.compose.ui.graphics.Color.Companion.LightGray
import androidx.compose.ui.graphics.Color.Companion.Transparent
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.constraintlayout.compose.ConstraintLayout
import com.keepcoding.nutris.R
import com.keepcoding.nutris.ui.theme.BlackTitle
import com.keepcoding.nutris.ui.theme.White

@Composable
fun TextIconChip(
    @DrawableRes iconId: Int,
    tintColor: Color,
    isSelected: Boolean,
    @StringRes text: Int,
    onChecked: (Boolean) -> Unit,
    selectedColor: Color = DarkGray
) {
    val shape = CircleShape
    ConstraintLayout(modifier = Modifier
        .padding(
            horizontal = 80.dp
        )
        .border(
            width = 1.dp,
            color = if (isSelected) selectedColor else LightGray,
            shape = shape
        )
        .background(
            color = if (isSelected) selectedColor else Transparent,
            shape = shape
        )
        .clip(shape = shape)
        .clickable {
            onChecked(!isSelected)
        }
        .fillMaxWidth()
        .height(50.dp)) {
        val (iconRef, textRef) = createRefs()

        Icon(
            painter = painterResource(id = iconId),
            tint = if (isSelected) White else tintColor,
            contentDescription = null,
            modifier = Modifier
                .constrainAs(iconRef) {
                    top.linkTo(parent.top)
                    bottom.linkTo(parent.bottom)
                    start.linkTo(parent.start, margin = 16.dp)
                }.size(25.dp)
        )

        Text(
            text = stringResource(id = text),
            color = if (isSelected) White else BlackTitle,
            modifier = Modifier.constrainAs(textRef) {
                top.linkTo(parent.top)
                bottom.linkTo(parent.bottom)
                start.linkTo(parent.start)
                end.linkTo(parent.end)
            },
            style = MaterialTheme.typography.body1
        )
    }

}

@Preview
@Composable
fun TextIconChipPreview() {
    TextIconChip(
        iconId = R.drawable.light_icon,
        tintColor = Color.Black,
        isSelected = false,
        text = R.string.light,
        onChecked = {},
        selectedColor = MaterialTheme.colors.primary
    )
}