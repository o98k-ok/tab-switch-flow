package main

import (
	"fmt"
	"github.com/o98k-ok/lazy/app"
	"os"
	"os/exec"
	"strings"
)

func main() {
	var word string
	if len(os.Args) >= 2 {
		word = os.Args[1]
	}

	cmd := "./get-tabs.scpt"
	out, err := exec.Command(cmd).CombinedOutput()
	if err != nil {
		fmt.Println(app.ErrItems("Failed", err).Encode())
		return
	}

	items := app.NewItems()
	for _, e := range strings.Split(strings.TrimSpace(string(out)), ";") {
		if e != "" && strings.Contains(e, word) {
			items.Append(app.NewItem(e, "", e, ""))
		}
	}

	if items.Size() == 0 {
		fmt.Println(app.EmptyItems().Encode())
		return
	}

	fmt.Println(items.Encode())
}
