package com.keepcoding.nutris.ui.common

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Button
import androidx.compose.material.ButtonDefaults
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import com.keepcoding.nutris.R
import com.keepcoding.nutris.ui.theme.BlueFacebook
import com.keepcoding.nutris.ui.theme.Body3
import com.keepcoding.nutris.ui.theme.White

@Composable
fun FacebookSignInButton(){
    Button(
        onClick = {
        },
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 70.dp),
        shape = RoundedCornerShape(6.dp),
        colors = ButtonDefaults.buttonColors(
            backgroundColor = BlueFacebook,
            contentColor = White,
        )
    ) {
        Image(
            modifier = Modifier
                .height(30.dp)
                .aspectRatio(1f),
            painter = painterResource(id = R.drawable.facebook_icon),
            contentDescription = ""
        )
        Text(
            text = stringResource(id = R.string.continue_with_facebook),
            style = Body3,
            modifier = Modifier.padding(6.dp)
        )
    }
}