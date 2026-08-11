<style>
    .feb-editorial { background: #f7f7f5; color: #181818; min-height: 60vh; padding-bottom: 80px; }
    .feb-editorial * { box-sizing: border-box; }
    .feb-editorial__hero { background: #111; color: #fff; padding: 72px 20px; text-align: center; }
    .feb-editorial__eyebrow { color: #c9ab70; font-size: 12px; font-weight: 700; letter-spacing: .22em; text-transform: uppercase; }
    .feb-editorial__hero h1 { margin: 10px 0 12px; color: #fff; font-size: clamp(34px, 5vw, 60px); font-weight: 700; letter-spacing: -.035em; }
    .feb-editorial__hero p { max-width: 620px; margin: 0 auto; color: #aaa; font-size: 16px; }
    .feb-editorial__container { width: min(1180px, calc(100% - 40px)); margin: 0 auto; }
    .feb-editorial__breadcrumbs { padding: 23px 0; color: #858585; font-size: 13px; }
    .feb-editorial__breadcrumbs a { color: #292929; text-decoration: none; }
    .feb-editorial__grid { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 28px; }
    .feb-editorial__card { overflow: hidden; display: flex; min-width: 0; flex-direction: column; background: #fff; border: 1px solid #e7e7e2; transition: transform .2s ease, box-shadow .2s ease; }
    .feb-editorial__card:hover { transform: translateY(-4px); box-shadow: 0 14px 35px rgba(0,0,0,.08); }
    .feb-editorial__image { display: block; aspect-ratio: 16 / 10; overflow: hidden; background: #ecece8; }
    .feb-editorial__image img { width: 100%; height: 100%; object-fit: cover; transition: transform .35s ease; }
    .feb-editorial__card:hover .feb-editorial__image img { transform: scale(1.035); }
    .feb-editorial__card-body { display: flex; flex: 1; flex-direction: column; padding: 25px; }
    .feb-editorial__meta { color: #9b7d48; font-size: 12px; font-weight: 700; letter-spacing: .1em; text-transform: uppercase; }
    .feb-editorial__card h2 { margin: 11px 0; color: #171717; font-size: 22px; line-height: 1.3; }
    .feb-editorial__card h2 a { color: inherit; text-decoration: none; }
    .feb-editorial__excerpt { margin: 0 0 22px; color: #6c6c6c; font-size: 14px; line-height: 1.75; }
    .feb-editorial__read { margin-top: auto; color: #171717; font-size: 13px; font-weight: 700; letter-spacing: .08em; text-decoration: none; text-transform: uppercase; }
    .feb-editorial__read span { color: #b28f54; margin-left: 7px; }
    .feb-editorial__empty { grid-column: 1 / -1; padding: 70px 20px; background: #fff; border: 1px solid #e7e7e2; color: #777; text-align: center; }
    .feb-editorial__pagination { display: flex; justify-content: center; margin-top: 45px; }
    .feb-editorial__pagination nav { width: auto; }
    .feb-editorial__article { max-width: 920px; margin: 0 auto; background: #fff; border: 1px solid #e7e7e2; }
    .feb-editorial__article-cover { width: 100%; max-height: 520px; object-fit: cover; }
    .feb-editorial__article-body { padding: clamp(28px, 6vw, 70px); }
    .feb-editorial__article-body h1 { margin: 10px 0 18px; color: #171717; font-size: clamp(30px, 4.5vw, 52px); line-height: 1.15; }
    .feb-editorial__article-content { color: #494949; font-size: 16px; line-height: 1.9; overflow-wrap: anywhere; }
    .feb-editorial__article-content img { max-width: 100%; height: auto; }
    .feb-editorial__article-content h2, .feb-editorial__article-content h3 { color: #1b1b1b; margin-top: 30px; }
    .feb-editorial__back { display: inline-flex; margin-top: 35px; color: #171717; font-size: 13px; font-weight: 700; text-decoration: none; text-transform: uppercase; }
    .feb-career-card { display: grid; grid-template-columns: 150px 1fr; background: #fff; border: 1px solid #e7e7e2; }
    .feb-career-card__image { min-height: 170px; background: #ecece8; }
    .feb-career-card__image img { width: 100%; height: 100%; object-fit: cover; }
    .feb-career-card__body { display: flex; flex-direction: column; padding: 25px; }
    .feb-career-card h2 { margin: 9px 0; font-size: 21px; }
    .feb-career-list { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 24px; }
    @media (max-width: 900px) {
        .feb-editorial__grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
        .feb-career-list { grid-template-columns: 1fr; }
    }
    @media (max-width: 575px) {
        .feb-editorial { padding-bottom: 55px; }
        .feb-editorial__hero { padding: 48px 18px; }
        .feb-editorial__container { width: min(100% - 28px, 520px); }
        .feb-editorial__grid { grid-template-columns: 1fr; gap: 18px; }
        .feb-career-card { grid-template-columns: 100px 1fr; }
        .feb-career-card__image { min-height: 145px; }
        .feb-career-card__body { padding: 18px; }
    }
</style>
