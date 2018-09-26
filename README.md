# pandoc-pipe

Pipe CodeBlock inside special Div to an external program and insert its output as raw html.

```
$ pandoc -f rst -t json
.. class:: sometype
    :execute:
    :command: ["echo", "123"]

    ::

        another word
        to fight
            spaces

        new line
<Ctrl-D>
{
  "blocks": [
    {
      "t": "Div",
      "c": [
        [
          "",
          [
            "sometype"
          ],
          [
            [
              "execute",
              ""
            ],
            [
              "command",
              "[\"echo\", \"123\"]"
            ]
          ]
        ],
        [
          {
            "t": "CodeBlock",
            "c": [
              [
                "",
                [],
                []
              ],
              "another word\nto fight\n    spaces\n\nnew line"
            ]
          }
        ]
      ]
    }
  ],
  "pandoc-api-version": [
    1,
    17,
    5,
    1
  ],
  "meta": {}
}
```
