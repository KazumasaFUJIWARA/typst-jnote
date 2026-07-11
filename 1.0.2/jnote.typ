// ダークモード用のテーマ状態
// jnote(dark: true) で "dark" に切り替わる
#let _jnote-theme = state("jnote-theme", "light")

// context 内で light / dark どちらの値を使うか選ぶ
#let _pick(light, dark) = if _jnote-theme.get() == "dark" { dark } else { light }

#let trans(input) = math.attach(
	input,
	tl: math.upright("t") // 左上(top-left)に直立体のtを配置
)
#let definition(title: none, id: none, it) = [
	#figure(
		kind: "prop",
		supplement: "定義",
	)[
		#context block(
			radius: 0pt,
			inset: 10pt,
			fill: _pick(luma(245), luma(35)),
			width: 100%,
			stroke: (left: 4pt + _pick(navy.lighten(-30%), navy.lighten(60%))),
		)[
			#align(left)[
				*定義 *
				*#context counter(figure.where(kind: "prop")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let theorem(title: none, id: none, it) = [
	#figure(
		kind: "prop",
		supplement: "定理",
	)[
		#context block(
			radius: 4pt,
			inset: 10pt,
			width: 100%,
			stroke: (1pt + _pick(red.lighten(-20%), red.lighten(30%))),
		)[
			#align(left)[
				*定理*
				#context counter(figure.where(kind: "prop")).display()
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let axiom(title: none, id: none, it) = [
	#figure(
		kind: "prop",
		supplement: "公理",
	)[
		#context block(
			radius: 4pt,
			inset: 10pt,
			width: 100%,
			stroke: (1pt + _pick(purple.lighten(-25%), purple.lighten(40%))),
		)[
			#align(left)[
				*公理*
				#context counter(figure.where(kind: "prop")).display()
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let proposition(title: none, id: none, it) = [
	#figure(
		kind: "prop",
		supplement: "命題",
	)[
		#context block(
			radius: 4pt,
			inset: 10pt,
			width: 100%,
			stroke: (1pt + _pick(orange.lighten(-20%), orange.lighten(20%))),
		)[
			#align(left)[
				*命題 *
				*#context counter(figure.where(kind: "prop")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let lemma(title: none, id: none, it) = [
	#figure(
		kind: "prop",
		supplement: "補題",
	)[
		#context block(
			radius: 4pt,
			inset: 10pt,
			width: 100%,
			stroke: (1pt + _pick(green.lighten(-20%), green.lighten(30%))),
		)[
			#align(left)[
				*補題 *
				*#context counter(figure.where(kind: "prop")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let corollary(title: none, id: none, it) = [
	#figure(
		kind: "prop",
		supplement: "系",
	)[
		#context block(
			radius: 4pt,
			inset: 10pt,
			width: 100%,
			stroke: (1pt + _pick(teal.lighten(-50%), teal.lighten(30%))),
		)[
			#align(left)[
				*系 *
				*#context counter(figure.where(kind: "prop")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let remark(title: none, id: none, it) = [
	#figure(
		kind: "prop",
		supplement: "註",
	)[
		#context block(
			inset: 10pt,
			width: 100%,
			stroke: (left: 2pt + _pick(maroon.lighten(-10%), maroon.lighten(50%))),
		)[
			#align(left)[
				*註 *
				*#context counter(figure.where(kind: "prop")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let example(title: none, id: none, it) = [
	#figure(
		kind: "prop",
		supplement: "例",
	)[
		#context block(
			inset: 10pt,
			width: 100%,
			stroke: (left: 2pt + _pick(olive.lighten(-10%), olive.lighten(50%))),
		)[
			#align(left)[
				*例 *
				*#context counter(figure.where(kind: "prop")).display()*
				#if title != none [* : #title *]
				#v(-0.3em)
				#it
			]
		]
	]
	#if id != none { label(id)}
]

#let proof(title: none, it) = {
	strong("証明: " + title)
	it
	align(right)[□]
}

#let appendix(body) = {
  set heading(numbering: "A.", supplement: [Appendix])
  counter(heading).update(0)
	set figure(
		numbering: num =>
			numbering("A.1", counter(heading).get().first(), num)
	)
  body
}

#let jnote(
	title: none,
	affiliation: none,
	author: none,
	date: none,
	dark: false,
	doc,
) = {
	// ダークモードを各コールアウトへ伝える
	_jnote-theme.update(if dark { "dark" } else { "light" })

	set page(
		margin: 20mm,
		paper: "a4",
		fill: if dark { luma(20) } else { white },
	)
	set text(
		size: 11pt,
		fill: if dark { luma(235) } else { black },
	)
	set heading(numbering: "1.")

	// level 1ヘッダーの更新時のみ変更
	show heading.where(level: 1): it => {
		counter(math.equation).update(0)
		counter(figure.where(kind: image)).update(0)
		counter(figure.where(kind: table)).update(0)
		counter(figure.where(kind: raw)).update(0)
		counter(figure.where(kind: "prop")).update(0)
		it
	}

	set math.equation(
		numbering: num =>
			numbering("(1.1)", counter(heading).get().first(), num),
			supplement: none,
	)
	set figure(
		numbering: num =>
			numbering("1.1", counter(heading).get().first(), num)
	)

	show math.equation: it => {
		if it.block and not it.has("label") [
			#counter(math.equation).update(v => v - 1)
			#math.equation(it.body, block: true, numbering: none) #label("_skip-eq")
		] else {
		it
		}
	}

	if title != none {
		align(center)[
			#text(size:18pt, weight: "bold")[#title]
		]
	}
	if date != none {
		align(right)[
			#text(size:12pt)[#date]
		]
	}
	if affiliation != none {
		v(-0.8em)
		align(right)[
			#text(size:12pt)[#affiliation]
		]
	}
	if author != none {
		v(-0.8em)
		align(right)[
			#text(size:12pt, weight: "bold")[#author]
		]
	}
	doc
}

