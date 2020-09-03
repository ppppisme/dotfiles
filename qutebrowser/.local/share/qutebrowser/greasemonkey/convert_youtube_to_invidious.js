const getVideoCode = link => {
    const matches = link.match(/(youtu\.be|youtube\.com)\/(embed\/|watch\?v\=)?([^$\&]+)/)

    if (matches === null) {
        return ''
    }

    return matches[3]
}

const getEmbedLink = code => {
    return 'https://invidious.snopyta.org/embed/' + code
}

const getWatchLink = code => {
    return 'https://invidious.snopyta.org/watch?v=' + code
}

const iframes = document.querySelectorAll(`
    iframe[src*="youtube.com/embed"]
`)

iframes.forEach(item => {
    item.src = getEmbedLink(getVideoCode(item.src))
})

const links = document.querySelectorAll(`
    a[href*="youtube.com/"],
    a[href*="youtu.be/"
`)

links.forEach(item => {
    item.href = getWatchLink(getVideoCode(item.href))
})
