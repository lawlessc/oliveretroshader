precision lowp float;

uniform sampler2D textureUnit0;
varying  lowp vec2 v_texCoord;
//pallete
lowp vec3 lighthest  = vec3(0.61,0.74,0.06);
lowp vec3 light      = vec3(0.55,0.67,0.06);
lowp vec3 dark       = vec3(0.19,0.38,0.19);
lowp vec3 darkest    = vec3(0.06,0.22,0.06);

void main() {
    float dx = 0.005859375;//3.0*(1./512.);
    float dy = 0.00390625; //2.*(1./512.);
    vec2 coord = vec2(dx*floor(v_texCoord.x/dx),
                      dy*floor(v_texCoord.y/dy));
    vec4 col = texture2D(textureUnit0, coord);

    float ave = (col.r + col.g +col.b)/3.0;
    vec3 fin;

    if(ave < 0.25){fin =darkest;}
    if(ave >= 0.25){fin =dark;}
    if(ave >= 0.50){fin =light;}
    if(ave >= 0.75){fin =lighthest;}

	gl_FragColor= vec4(fin,1.0);
}