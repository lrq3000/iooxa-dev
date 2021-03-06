{% extends "layout/article.tpl" %}
{% block article %}
<h1>Introduction</h1>
<r-outline class="popout"></r-outline>
<!-- IOOXA https://api.iooxa.com/blocks/CgfG3BXYMgMzS5Dzook2/xiNiWaRH0ogcRY4pSQIT -->
  <p>
    We think that creating beautiful reactive documents and explorable explanations should be easy. Writing technical
    documents is hard enough already, and choosing to make that writing <em>interactive</em> is beyond the reach of most
    communicators - who often have limited or no development experience.
  </p>
  <p>
    Providing multiple visuals of images, text, and equations that are all interconnected allows your readers to
    interrogate models, build intuition and <em>play</em> with ideas. Not every explanation is best suited to be augmented
    with interactive content, however, not every explanation is best represented by paper, or the computer simulated
    version: the PDF.
  </p>
  <p>
    We are working on <a href="https://iooxa.com">an editor and publishing platform</a> to try to lower the barriers
    around creating reactive documents and are committed to the core of these documents being open source, so you can take
    your documents anywhere. <code>iooxa.dev</code> is a collection of open source tools and packages that aim to lower
    the barrier to interactive scientific writing.
  </p>
<!-- /IOOXA -->

<hr>

<h2 id="for-example">But first, an example!</h2>


<r-scope name="sincos">
  <r-var name="r" value="0.35"></r-var>
  <r-var name="theta" value="0" format=".1f"></r-var>
  <r-var name="xC" :value="Math.cos(theta)*r-0.5"></r-var>
  <r-var name="yC" :value="Math.sin(theta)*r+0.5"></r-var>
  <r-var name="sOrigin" value="false" type="Boolean"></r-var>
  <r-var name="sRadius" value="false" type="Boolean"></r-var>
  <r-var name="sAngle" value="false" type="Boolean"></r-var>
  <r-var name="wR" value="1"></r-var>
  <r-var name="wG" value="3"></r-var>
  <r-var name="wB" value="1"></r-var>
  <r-var name="wSin" value="3"></r-var>
  <r-var name="wCos" value="3"></r-var>
  <aside>
    <p>
      To interact with this explanation, you can hover over the bolded text, or drag the node in the chart, or update $\theta$:
      <br>
      $\theta=$ <r-range :value="theta *180 / Math.PI" :change="{theta: value * Math.PI / 180}" min="0" max="360" ></r-range>
      <r-dynamic bind="theta" min="0" step="0.01" :max="Math.PI*2" periodic="true" :transform="value*180/Math.PI" after="º"></r-dynamic>
    </p>
  </aside>
  <p>
    In trigonometry, a
    <r-action :hover="{wG:enter?8:3}"><strong style="color:green">unit circle</strong></r-action>
    is the circle of
    <r-action :hover="{sRadius:enter}"><strong style="color:#333">radius</strong></r-action>
    one centered at the <r-action :hover="{sOrigin:enter}"><strong style="color:#333">origin</strong></r-action>
    $(0, 0)$ in the Cartesian coordinate system. Let a
    <r-action :hover="{sRadius:enter}"><strong style="color:#333">line</strong></r-action>
    through the
    <r-action :hover="{sOrigin:enter}"><strong style="color:#333">origin</strong></r-action>,
    making an
    <r-action :hover="{sAngle:enter}"><strong style="color:#333">angle</strong></r-action>,
    of $\theta$=
    <r-dynamic bind="theta" min="0" step="0.01" :max="Math.PI*2" periodic="true" :transform="value*180/Math.PI" after="º"></r-dynamic>
    with the positive half of the x-axis, intersect the
    <r-action :hover="{wG:enter?8:3}"><strong style="color:green">unit circle</strong></r-action>.
    The
    <r-action :hover="{wB:enter?3:1}"><strong style="color:blue">x-coordinates</strong></r-action>
    and
    <r-action :hover="{wR:enter?3:1}"><strong style="color:red">y-coordinates</strong></r-action>
    of this point of intersection are equal to
    <r-action :hover="{wCos:enter?8:3}"><strong style="color:blue">$\cos(\theta)$</strong></r-action>
    and
    <r-action :hover="{wSin:enter?8:3}"><strong style="color:red">$\sin(\theta)$</strong></r-action>,
    respectively.
    <a href="https://en.wikipedia.org/wiki/Sine#Unit_circle_definition" target="_blank">See Wikipedia</a>.
  </p>
  <r-svg-chart xlim="[-1, 2]" ylim="[-1, 1]" height="400" width="600" x-axis-location="hidden"
    y-axis-location="hidden">
    <!-- Create Axis -->
    <r-svg-path :data="[[-1,0],[2, 0],[],[0, -1], [0, 1]]" stroke="#ddd" stroke-width="2"></r-svg-path>
    <r-svg-path :data="[[-1, 0.5-r],[2, 0.5-r],[],[-1, 0.5], [2, 0.5],[],[-1, 0.5+r],[2, 0.5+r]]" stroke="#ddd"
      stroke-width="0.5"></r-svg-path>
    <r-svg-path :data="[[ 0,-0.5-r],[2,-0.5-r],[],[ 0,-0.5], [2,-0.5],[],[ 0,-0.5+r],[2,-0.5+r]]" stroke="#ddd"
      stroke-width="0.5"></r-svg-path>
    <r-svg-path :data="[[-0.5-r,1],[-0.5-r,0],[],[-0.5,1], [-0.5,0],[],[-0.5+r,1],[-0.5+r,0]]" stroke="#ddd"
      stroke-width="0.5"></r-svg-path>
    <!-- Three equations for the bottom-left curve -->
    <r-svg-eqn eqn="[-Math.cos(t)*(-0.5-r), -Math.sin(t)*(-0.5-r)]" parameterize="t" :domain="[Math.PI, Math.PI*1.5]"
      stroke="#ddd" stroke-width="0.5"></r-svg-eqn>
    <r-svg-eqn eqn="[-Math.cos(t)/-2, -Math.sin(t)/-2]" parameterize="t" :domain="[Math.PI, Math.PI*1.5]"
      stroke="#ddd" stroke-width="0.5"></r-svg-eqn>
    <r-svg-eqn eqn="[-Math.cos(t)*(-0.5+r), -Math.sin(t)*(-0.5+r)]" parameterize="t" :domain="[Math.PI, Math.PI*1.5]"
      stroke="#ddd" stroke-width="0.5"></r-svg-eqn>
    <!-- Guidelines from the current point (xC,yC) -->
    <r-svg-path :data="[[xC, yC], [0, yC]]" stroke="red" :stroke-width="wR"></r-svg-path>
    <r-svg-path :data="[[xC, yC], [xC, 0]]" stroke="blue" :stroke-width="wB"></r-svg-path>
    <r-svg-eqn eqn="[-Math.cos(t)*xC, -Math.sin(t)*xC]" parameterize="t" :domain="[Math.PI, Math.PI*1.5]"
      stroke="blue" :stroke-width="wB"></r-svg-eqn>
    <!-- Text labels -->
    <r-svg-text text="sin(&theta;)" x="1.6" :y=" 0.43-r" fill="red"></r-svg-text>
    <r-svg-text text="cos(&theta;)" x="1.6" :y="-0.57-r" fill="blue"></r-svg-text>
    <!-- Origin, radius and angle: default is hidden -->
    <r-svg-circle x="-0.5" y="0.5" :visible="sOrigin" fill="#333"></r-svg-circle>
    <r-svg-path :data="[[-0.5, 0.5], [xC,yC]]" :visible="sRadius" stroke="#333" stroke-width="3"></r-svg-path>
    <r-svg-eqn eqn="[Math.cos(t)*0.1 - 0.5, Math.sin(t)*0.1 + 0.5]" parameterize="t" :domain="[0, theta]"
      :visible="sAngle" stroke="#333" stroke-width="3"></r-svg-eqn>
    <r-svg-path :data="[[xC,yC], [-0.5, 0.5], [-0.5 + r,0.5]]" :visible="sAngle" stroke="#333" stroke-width="2">
    </r-svg-path>
    <!-- A circle! -->
    <r-svg-eqn eqn="[Math.cos(t)*r-0.5, Math.sin(t)*r+0.5]" parameterize="t" :domain="[0, Math.PI*2]" stroke="green"
      :stroke-width="wG"></r-svg-eqn>
    <!-- Offset sin and cos waves -->
    <r-svg-eqn eqn="Math.sin(x* Math.PI+theta)*r + 0.5" domain="[0, 2]" stroke="red" :stroke-width="wSin"></r-svg-eqn>
    <r-svg-eqn eqn="Math.cos(x* Math.PI+theta)*r - 0.5" domain="[0, 2]" stroke="blue" :stroke-width="wCos">
    </r-svg-eqn>
    <!-- A drag node to change the offset -->
    <r-svg-node :x="xC" :y="yC" fill="#333" :drag="{theta: (Math.PI * 2 + Math.atan2(y-0.5, x+0.5)) % (Math.PI * 2)}">
    </r-svg-node>
  </r-svg-chart>
</r-scope>

<hr>

<h2>Overview</h2>

<!-- IOOXA https://api.iooxa.com/blocks/CgfG3BXYMgMzS5Dzook2/qkL20MSIechpmsfhlUbf -->
<p>
  There are a few things going on in the above example! The example is supported by four packages:
  <ul>
    <li><p><code>@iooxa/runtime</code> keeps track of the reactive state of the page</p></li>
    <li><p><code>@iooxa/components</code> reactive components for text, inputs, sliders, equations, code, etc.</p></li>
    <li><p><code>@iooxa/svg</code> reactive svg components for simple interactive diagrams</p></li>
    <li><p><code>@iooxa/article</code> bundles together all of the above, and provides CSS layouts</p></li>
  </ul>
</p>
<!-- /IOOXA -->

<a href="/components" style="text-decoration: none; float: right;"><r-button outlined label="components docs"></r-button></a>
<h3>@iooxa/components</h3>

<aside>
  <p>
    For more information on why we chose web-components,
    and how this works with other frameworks (it does!), check out our blog.
  </p>
</aside>
<p>
  The <code>@iooxa/components</code> package provides many <strong>r</strong>eactive web-components
  that work with the <strong>r</strong>untime package (which is based on <strong>r</strong>edux).
  With so many <strong>r</strong>'s, we decided to use this p<strong>r</strong>efix to denote these <strong>r</strong>eactive components.
  For example, <code>&lt;r-var&gt;</code> creates a <strong>r</strong>eactive variable, and
  <code>&lt;r-display&gt;</code> will display the up-to-date value or that variable.
</p>

<r-scope name="rVar">
  <r-demo>
    <r-var name="myFirstVariable" value="42" format=".0f"></r-var>
    <p>
      The most special number is <r-display bind="myFirstVariable"></r-display>.
    </p>
  </r-demo>
  <aside>
    <p>
      We know this is still a little hard, which is why we are working on an editor to make writing very easy!!
      <img src="/images/var-editor.gif" style="border: 1px solid #333;"><br>
      Sign up for our <a href="{{ site.mailchimp }}" target="_blank">mailing list</a> to learn more!
    </p>
  </aside>
  <p>
    To learn more about reactive variables, please see the <a href="/components">components documentation</a>,
    where you will learn how to <r-action :click="{myFirstVariable: Math.random() * 100}">update values</r-action>,
    transform text, have dynamic text (<r-dynamic bind="myFirstVariable"></r-dynamic>), add sliders (<r-range bind="myFirstVariable"></r-range>),
    show equations <r-equation inline>(x = <r-display bind="myFirstVariable">)</r-display>)</r-equation>,
    and much more!
  </p>
</r-scope>

<hr>

<a href="/article" style="text-decoration: none; float: right;"><r-button outlined label="article docs"></r-button></a>
<h3>@iooxa/article</h3>
<aside>
  <p>
    The <code>@iooxa/article</code> library also includes styles!
    So you can write in the margins, or callout important things!
  </p>
</aside>
<p>To get started can put this javascript and css bundle in your page:</p>
<r-code compact copy>
  &lt;link rel="stylesheet" href="https://unpkg.com/@iooxa/article/dist/iooxa.css"&gt;
  &lt;script async src="https://unpkg.com/@iooxa/article"&gt;&lt;/script&gt;
</r-code>

<p>
  You can also download the <a href="https://github.com/iooxa/article/releases" target="_blank">latest release</a> from GitHub.
  If you are running this <emph>without</emph> a web server, ensure the script has <code>charset="utf-8"</code> in
  the script tag.
</p>


<a href="/svg" style="text-decoration: none; float: right;"><r-button outlined label="svg docs"></r-button></a>
<h3>@iooxa/svg</h3>

<p>
  The <code>svg</code> package provides a light wrapper on some commonly used <code>&lt;svg&gt;</code>
  elements as well as leveraging <code>d3</code> to create paths, drag-nodes and equations.
  The goal is to make it easy to create simple interactive graphics, but not to provide all the functionality
  that you would expect from a charting library. For that we (will!) provide a wrapper to Vega, or you can help out
  by contributing other extensions that use the <code>runtime</code> library!
</p>

<r-scope name="ymxb">
  <aside>
    <r-var name="m" value="1"></r-var>
    <r-var name="b" value="1"></r-var>
    <p>$m$ = <r-range bind="m" min="-10" max="10"></r-range>
      <r-display bind="m"></r-display>
    </p>
    <p>$b$ = <r-range bind="b" min="-10" max="10"></r-range>
      <r-display bind="b"></r-display>
    </p>
    <r-equation aligned>
      y &= m \times x + b \\
      y &=
      <r-display :value="m==-1 || m == 0 || m == 1? '' : m" format=".0f"></r-display>
      <r-visible :visible="m == -1">-</r-visible>
      <r-visible :visible="m !== 0">x</r-visible>
      <r-display :value="b==0? '' : b" :format="m==0 ? '.0f' : '+.0f'">+1</r-display>
      <r-visible :visible="m == 0 && b ==0">0</r-visible>
    </r-equation>
  </aside>
  <r-demo>
    <r-svg-chart width="300" height="300" x-axis-location="origin" y-axis-location="origin" xlim="[-10,10]" ylim="[-10,10]">
      <r-svg-eqn eqn="m*x + b" :listen="[m, b]"></r-svg-eqn>
      <r-svg-eqn eqn="m/10*x**2 + b" :listen="[m, b]"></r-svg-eqn>
      <r-svg-node x="0" :y="b" :drag="{b: y}"></r-svg-node>
      <r-svg-node x="5" :y="m*5 + b" :drag="{m: (y - b) / 5}"></r-svg-node>
      <r-svg-node x="-5" :y="m/10*25 + b" :drag="{m: (y - b) / 25 * 10}"></r-svg-node>
    </r-svg-chart>
  </r-demo>
</r-scope>

<a href="/runtime" style="text-decoration: none; float: right;"><r-button outlined label="runtime docs"></r-button></a>
<h3>@iooxa/runtime</h3>

<p>
  The <code>@iooxa/runtime</code> library allows you to create variables and components that react to changes in state through
  <strong>user-defined</strong> functions. The runtime is a small component that can be used in other packages
  to keep the state of a document reactive. It has <strong>no user interface</strong>.
  The package is based on <a href="https://redux.js.org/" target="_blank">Redux</a> which is compatible with many popular
  javascript frameworks (e.g. <a href="https://reactjs.org/" target="_blank">React</a>, <a href="https://vuejs.org/" target="_blank">Vue</a>, etc.).
</p>

<h2>License and Contact</h2>
<p>
  Everything is distributed under the permissive
  <a href="https://github.com/iooxa/article/blob/master/LICENSE">MIT License</a>
  to make it easy for you to use these packages with your other projects!
</p>
{% include 'content/introduction-snippet.tpl' %}
{% endblock%}
